-- CoA worldforged: in-game position check (batch 2)
-- Pickups visited in game, positions read with .gps. Corrects several batch 1 (#7909) placements,
-- keeps one spawn per verified spot and removes the extra copies of those items.
-- Every row only applies while the pickup is still where main had it (2026-10-21, 4eb73db3),
-- so a newer correction to the same pickup is never overwritten or deleted. Orientation is unchanged.
-- None of the removed GUIDs has rows in other world tables (addon, pool, event).

-- Elune Tear Fragment (6941681): nudged 2 yd to the correct spot
UPDATE `gameobject` SET `position_x` = 2902.61, `position_y` = -960.96, `position_z` = 199.58 WHERE `guid` = 6941681 AND `map` = 1 AND `position_x` BETWEEN 2900.3 AND 2901.3 AND `position_y` BETWEEN -960.4 AND -959.4;
-- Argent Sentry Pauldrons (6940076): batch 1 put it on a zone-mislabelled spot in Alterac Mountains; back near its original CoACore position (19 yd)
UPDATE `gameobject` SET `position_x` = -3929.24, `position_y` = -1810.72, `position_z` = 157.3 WHERE `guid` = 6940076 AND `map` = 0 AND `position_x` BETWEEN 271.0 AND 272.0 AND `position_y` BETWEEN -175.3 AND -174.3;
-- Eboncrypt Band (6940415): batch 1 put it on a zone-mislabelled spot in Alterac Mountains; back at its original CoACore spot (6 yd)
UPDATE `gameobject` SET `position_x` = -2610.62, `position_y` = -1500.63, `position_z` = -12.45 WHERE `guid` = 6940415 AND `map` = 0 AND `position_x` BETWEEN 1189.7 AND 1190.7 AND `position_y` BETWEEN 31.1 AND 32.1;
-- Red Metal Pauldrons (6940945): batch 1 put it on a zone-mislabelled spot; the checked position is on Kalimdor (map 1), so the map changes too
UPDATE `gameobject` SET `map` = 1, `position_x` = 2958.51, `position_y` = -836.36, `position_z` = 194.55 WHERE `guid` = 6940945 AND `map` = 0 AND `position_x` BETWEEN 1019.8 AND 1020.8 AND `position_y` BETWEEN 467.3 AND 468.3;

-- Forbidden Fruit belongs in Eastern Plaguelands (spot verified in game and on video).
-- 6940495 already stands there (0.3 yd off the checked position): keep it, set the exact position.
UPDATE `gameobject` SET `position_x` = 1554.37, `position_y` = -3811.57, `position_z` = 116.23 WHERE `guid` = 6940495 AND `id` = 90480 AND `map` = 0 AND `position_x` BETWEEN 1553.6 AND 1554.6 AND `position_y` BETWEEN -3812.0 AND -3811.0;
-- 6940494: batch 1 copy on a zone-mislabelled spot in Alterac Mountains
DELETE FROM `gameobject` WHERE `guid` = 6940494 AND `id` = 90480 AND `map` = 0 AND `position_x` BETWEEN 8.4 AND 9.4 AND `position_y` BETWEEN -274.0 AND -273.0;
-- 6941743: copy on Kalimdor
DELETE FROM `gameobject` WHERE `guid` = 6941743 AND `id` = 90480 AND `map` = 1 AND `position_x` BETWEEN -7190.2 AND -7189.2 AND `position_y` BETWEEN -3792.0 AND -3791.0;

-- Quel'thalas Commander Aegis: the in-game check put it at 3323.82, -4269.18; keep 6940919 there.
UPDATE `gameobject` SET `position_x` = 3323.82, `position_y` = -4269.18, `position_z` = 160.06 WHERE `guid` = 6940919 AND `id` = 90531 AND `map` = 0 AND `position_x` BETWEEN 1239.2 AND 1240.2 AND `position_y` BETWEEN -565.6 AND -564.6;
-- 6940920: second spawn of the same item 43 yd away
DELETE FROM `gameobject` WHERE `guid` = 6940920 AND `id` = 90531 AND `map` = 0 AND `position_x` BETWEEN 3329.3 AND 3330.3 AND `position_y` BETWEEN -4226.8 AND -4225.8;

-- Burning Blade Mark belongs in Dustwind Cave.
-- 6941512: moved to the checked spot in the cave
UPDATE `gameobject` SET `position_x` = 917.05, `position_y` = -4730.91, `position_z` = 13.64 WHERE `guid` = 6941512 AND `id` = 95642 AND `map` = 1 AND `position_x` BETWEEN 929.5 AND 930.5 AND `position_y` BETWEEN -4721.0 AND -4720.0;
-- 6941513: copy that #7673 moved to Darkshore, where nothing reports this item
DELETE FROM `gameobject` WHERE `guid` = 6941513 AND `id` = 95642 AND `map` = 1 AND `position_x` BETWEEN 6619.6 AND 6620.6 AND `position_y` BETWEEN -497.6 AND -496.6;
