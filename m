Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B1D481424
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Dec 2021 15:34:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPDRn6Ps1z30BM
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Dec 2021 01:33:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=u1uYJPYL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H8vf7lCr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.26;
 helo=wnew1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=u1uYJPYL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H8vf7lCr; 
 dkim-atps=neutral
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPDRd3mnRz2yxP
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Dec 2021 01:33:48 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id DAA342B0009C;
 Wed, 29 Dec 2021 09:33:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Dec 2021 09:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=EHjpGtshIGgIZ7uZEVdFJh9MDO
 ucPBHcIEoU2Ex0JjI=; b=u1uYJPYLLbM0vrsBqQ0P1MpsVLDFreUpgrFFa6pGuD
 3na44+jcWJJnA1EjEcLFB8AqwY4pYZthRcbmdGXXoxlgn2OSNDfua/2CHFbe6AiR
 VNWJgPUFyEgl38nb9bbKU9r7N/2eaet+o+xA3iwd1hVgGJU/eSCSrEpq55XdC67j
 BZ9gKc6atHp9+i1VzVVaT1N0LSiZ4Yw3/kR/aqSoMeFJ1ACNeb7Py4e+6mbckE7t
 VOfIelvutzgvwxL74arTQTrN+vy3NO4uQemR2op8XhvEoyxBkKYtq+b8ir8gS10m
 2AFMUjZY1UzCq8eTvqDgq+xoZkjCL2xR9gqMSgtJKbJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EHjpGtshIGgIZ7uZE
 VdFJh9MDOucPBHcIEoU2Ex0JjI=; b=H8vf7lCrVtO1ZAkyK8EjURMYAFQpLx2Wg
 YY2tk6owmyenJRatyZNykOHFUeGVl/38fZk533jSWBnZeMtqN/3XY0aqkFh+EhXI
 G/aAPgXJul7rzrrx7XggG8FmBQoZ6TJQ8KH61C8vhf6gego5dA7hOt6b8nae47lU
 iVMZeMV1jv2gVVhvxJJKZFjhPtwLB7Fu4SOxV74/IKENGLB9+2mEBvzKS2sTCOqL
 6WU24xU3cNkAt75vGgo23hvZcOWqHV6Tf/XjXvjal+F/G1NpVCkmPqk+Ltfo0wuG
 e1PJ3NlXOVWQTLry3F3fP77pNrYoWF1LVgKf9zpSlkt3R7TzXWuDA==
X-ME-Sender: <xms:w3HMYa9TzpFFU_t7blDTwhbvIGrcwbFYm_12VPHfXl1elFo601nu-Q>
 <xme:w3HMYav3UqPVp6MmeWDi52uAzz6gGHOB76gIFt9Z6GMCTUnnkJhGt03NfSlqFXErQ
 fFpuqXxi72436dTf44>
X-ME-Received: <xmr:w3HMYQBu26dnGil1Z0YwSXGp3XHkoAi440OA-J0uMpWZYLKfc9PSeAiEI-T0hVrQ97Ddb30x7w24LMQrPw00GM8EZ5BklLyL9iQ3AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvuddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvffufffkofgggfestdekredtredttden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeludegheejteelheduudegkeehleet
 feekiedtfefgleeifeelhefgveejhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:w3HMYSdCJUpjxy3XzmEa16coIpp63dscgZTcBXj4H2DiAHkj9hrKug>
 <xmx:w3HMYfP4gxXspuQ4DMrBuHf-_bY3nS7oJpGIe61Bsye9_6JplhcwmQ>
 <xmx:w3HMYcntxXV9wMlAlLg8Z1wbnm1BxhQ3kMwo7Yt0JSkHEOL1beLlVQ>
 <xmx:xHHMYTkjIFOxyexfq-LnrNz_ups8-ct2K6Xc81bOGUmYmGa_FdnqL0JIX00>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Dec 2021 09:33:38 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] mtd: aspeed-smc: improve probe resilience
Date: Wed, 29 Dec 2021 08:33:33 -0600
Message-Id: <20211229143334.297305-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>,
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The aspeed-smc can have multiple SPI devices attached to it in the
device tree.  If one of the devices is missing or failing the entire
probe will fail and all MTD devices under the controller will be
removed.  On OpenBMC this results in a kernel panic due to missing
rootfs:

[    0.538774] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    0.540471] aspeed-smc 1e620000.spi: w25q01jv-iq (131072 Kbytes)
[    0.540750] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x28000000 ] 128MB
[    0.540943] aspeed-smc 1e620000.spi: CE1 window [ 0x28000000 - 0x2c000000 ] 64MB
[    0.541143] aspeed-smc 1e620000.spi: read control register: 203b0041
[    0.581442] 5 fixed-partitions partitions found on MTD device bmc
[    0.581625] Creating 5 MTD partitions on "bmc":
[    0.581854] 0x000000000000-0x0000000e0000 : "u-boot"
[    0.584472] 0x0000000e0000-0x000000100000 : "u-boot-env"
[    0.586468] 0x000000100000-0x000000a00000 : "kernel"
[    0.588465] 0x000000a00000-0x000006000000 : "rofs"
[    0.590552] 0x000006000000-0x000008000000 : "rwfs"
[    0.592605] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    0.592801] aspeed-smc 1e620000.spi: unrecognized JEDEC id bytes: 00 00 00 00 00 00
[    0.593039] Deleting MTD partitions on "bmc":
[    0.593175] Deleting u-boot MTD partition
[    0.637929] Deleting u-boot-env MTD partition
[    0.829527] Deleting kernel MTD partition
[    0.856902] Freeing initrd memory: 1032K
[    0.866428] Deleting rofs MTD partition
[    0.906264] Deleting rwfs MTD partition
[    0.986628] aspeed-smc 1e620000.spi: Aspeed SMC probe failed -2
[    0.986929] aspeed-smc: probe of 1e620000.spi failed with error -2
...
[    2.936719] /dev/mtdblock: Can't open blockdev
mount: mounting /dev/mtdblock on run/initramfs/ro failed: No such file or directory
[    2.963030] MTD: Couldn't look up '/dev/mtdblock': -2
mount: mounting /dev/mtdblock on run/initramfs/rw failed: No such file or directory

Mounting read-write /dev/mtdblock filesystem failed.  Please fix and run
	mount /dev/mtdblock run/initramfs/rw -t jffs2 -o rw
or perform a factory reset with the clean-rwfs-filesystem option.
Fatal error, triggering kernel panic!
[    3.013047] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100

Many BMC designs have two flash chips so that they can handle a hardware
failure of one of them.  If one chip failed, it doesn't do any good to
have redundancy if they all get removed anyhow.

Improve the resilience of the probe function to handle one of the
children being missing or failed.  Only in the case where all children
fail to probe should the controller be failed out.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 7225870e8b18..acfe010f9dd7 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -769,6 +769,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	struct device_node *child;
 	unsigned int cs;
 	int ret = -ENODEV;
+	bool found_one = false;
 
 	for_each_available_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
@@ -827,8 +828,17 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		 * by of property.
 		 */
 		ret = spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
+		/*
+		 * If we fail to scan the device it might not be present or
+		 * broken.  Don't fail the whole controller if others work.
+		 */
+		if (ret) {
+			if (found_one)
+				ret = 0;
+
+			devm_kfree(controller->dev, chip);
+			continue;
+		}
 
 		ret = aspeed_smc_chip_setup_finish(chip);
 		if (ret)
@@ -839,6 +849,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 			break;
 
 		controller->chips[cs] = chip;
+		found_one = true;
 	}
 
 	if (ret) {
-- 
2.32.0

