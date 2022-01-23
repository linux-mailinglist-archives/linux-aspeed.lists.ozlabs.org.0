Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2F4972B9
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Jan 2022 16:51:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhczC3VdZz30RD
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jan 2022 02:51:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhcz415Jcz30L1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jan 2022 02:50:54 +1100 (AEDT)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 88C6EC97D5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Jan 2022 15:39:46 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE7CA20004;
 Sun, 23 Jan 2022 15:39:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Patrick Williams <patrick@stwcx.xyz>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Date: Sun, 23 Jan 2022 16:39:24 +0100
Message-Id: <20220123153924.673172-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211229143334.297305-1-patrick@stwcx.xyz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7f852ec58af6ce8d7c6fc799b82d45d76e4bd994'
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
Cc: Potin Lai <potin.lai@quantatw.com>, linux-mtd@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2021-12-29 at 14:33:33 UTC, Patrick Williams wrote:
> The aspeed-smc can have multiple SPI devices attached to it in the
> device tree.  If one of the devices is missing or failing the entire
> probe will fail and all MTD devices under the controller will be
> removed.  On OpenBMC this results in a kernel panic due to missing
> rootfs:
> 
> [    0.538774] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> [    0.540471] aspeed-smc 1e620000.spi: w25q01jv-iq (131072 Kbytes)
> [    0.540750] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x28000000 ] 128MB
> [    0.540943] aspeed-smc 1e620000.spi: CE1 window [ 0x28000000 - 0x2c000000 ] 64MB
> [    0.541143] aspeed-smc 1e620000.spi: read control register: 203b0041
> [    0.581442] 5 fixed-partitions partitions found on MTD device bmc
> [    0.581625] Creating 5 MTD partitions on "bmc":
> [    0.581854] 0x000000000000-0x0000000e0000 : "u-boot"
> [    0.584472] 0x0000000e0000-0x000000100000 : "u-boot-env"
> [    0.586468] 0x000000100000-0x000000a00000 : "kernel"
> [    0.588465] 0x000000a00000-0x000006000000 : "rofs"
> [    0.590552] 0x000006000000-0x000008000000 : "rwfs"
> [    0.592605] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> [    0.592801] aspeed-smc 1e620000.spi: unrecognized JEDEC id bytes: 00 00 00 00 00 00
> [    0.593039] Deleting MTD partitions on "bmc":
> [    0.593175] Deleting u-boot MTD partition
> [    0.637929] Deleting u-boot-env MTD partition
> [    0.829527] Deleting kernel MTD partition
> [    0.856902] Freeing initrd memory: 1032K
> [    0.866428] Deleting rofs MTD partition
> [    0.906264] Deleting rwfs MTD partition
> [    0.986628] aspeed-smc 1e620000.spi: Aspeed SMC probe failed -2
> [    0.986929] aspeed-smc: probe of 1e620000.spi failed with error -2
> ...
> [    2.936719] /dev/mtdblock: Can't open blockdev
> mount: mounting /dev/mtdblock on run/initramfs/ro failed: No such file or directory
> [    2.963030] MTD: Couldn't look up '/dev/mtdblock': -2
> mount: mounting /dev/mtdblock on run/initramfs/rw failed: No such file or directory
> 
> Mounting read-write /dev/mtdblock filesystem failed.  Please fix and run
> 	mount /dev/mtdblock run/initramfs/rw -t jffs2 -o rw
> or perform a factory reset with the clean-rwfs-filesystem option.
> Fatal error, triggering kernel panic!
> [    3.013047] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100
> 
> Many BMC designs have two flash chips so that they can handle a hardware
> failure of one of them.  If one chip failed, it doesn't do any good to
> have redundancy if they all get removed anyhow.
> 
> Improve the resilience of the probe function to handle one of the
> children being missing or failed.  Only in the case where all children
> fail to probe should the controller be failed out.
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
