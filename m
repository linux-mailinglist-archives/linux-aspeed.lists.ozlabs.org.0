Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16375E8A
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:42:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vyds207fzDqCD
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:42:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cV4yADjL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="006pBoW7"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vycB0p29zDqDr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:57 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 819A1433F;
 Fri, 26 Jul 2019 01:40:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ySR7cLE+z5RVR
 IPpRsSru07Wn3TKVni1uEQzDMaQ8y8=; b=cV4yADjLkVVUORlObYa6LqQigb3lP
 xz+qQc05pQI0ZbOeucEGtpYDXdvQlNFDB0CkM5+puib71KA8eqD3+NGnqdpQNAne
 Erms0L7nbfiLeTVqe5vgugdHQw70uLrRzjfrH50Klr8BgnZuCBERcLJ+q+bVlK38
 WhExg1eOwV9pbPnXeC/bu9ywqBUOIFP5bG2PRE16pQZLRs4o6O1VniBjLIQztCVk
 2OQdEwrhRAYNDCVPHmt4KhZK7SCQdsl6108fDrYS5+HXDcITAHsJnucE4afUlMop
 iFSOmniBopp09pHY3uefeXQgaq+0tYnfaZH6HosvcIoT/Ov9xGC933X9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ySR7cLE+z5RVRIPpRsSru07Wn3TKVni1uEQzDMaQ8y8=; b=006pBoW7
 iyoZZ4nE/Bt5esVJlv/ekNGTH0kuhMtqXslqmby5mBpAO7txLV7Wdov+gyDpGZjr
 TXVC5a6+8qDMtz+WFQGqKvxfn4zNhQYkvDggx1a11zH3hMFCcdrhxNumu1TqXKJl
 R2smEzDNM4+9kpfZ0bR+S6hLl8ZMxCBa1Q2UrJq0dBC8IhA37eMW/RpU1OzUCoIZ
 H2CwPoBX32Mju5P3GVUjru/XSsGdya8fZ+oN9fbM1XZMEIwq6fwMSWp1Q3gOVTxX
 P2GdRlE0Vpn0z1KeFs9m4AoaqKwtrYme7k9hu1+YE0YXYevsHKGNWw1nmj85FD9m
 3aivOTxmmJQ5+Q==
X-ME-Sender: <xms:Z5I6XaFHRxafrarr1iPEmUFdrZKsXMX5hiGQ50a-VQRNzbw1-cRMEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:Z5I6XV4zCpvKdsrHzhEHoL-oLdwWkv7ntI6qx3oXTQij2sLNxYnT3w>
 <xmx:Z5I6XQthRuUbBA-7JLsoIdW6k3gHo_EL33IHu0o6j85qDBCtm2pvrg>
 <xmx:Z5I6XW5pjIdL65NXdvhBZcZYaTAkXhAOTednvp4fUCZfxAWOqTtdcw>
 <xmx:Z5I6XWKu9VJh8QbcBYRyIAlxH9OsPjZb2ZB8gtiEEWc21QJ4pWKPqg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 49AD6380075;
 Fri, 26 Jul 2019 01:40:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 14/17] ipmi: kcs: Finish configuring ASPEED KCS device
 before enable
Date: Fri, 26 Jul 2019 15:09:56 +0930
Message-Id: <20190726053959.2003-15-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Corey Minyard <minyard@acm.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The currently interrupts are configured after the channel was enabled.

Cc: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: Corey Minyard <minyard@acm.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: openipmi-developer@lists.sourceforge.net
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 3c955946e647..e3dd09022589 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -268,13 +268,14 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	kcs_bmc->io_inputb = aspeed_kcs_inb;
 	kcs_bmc->io_outputb = aspeed_kcs_outb;
 
+	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
+	if (rc)
+		return rc;
+
 	dev_set_drvdata(dev, kcs_bmc);
 
 	aspeed_kcs_set_address(kcs_bmc, addr);
 	aspeed_kcs_enable_channel(kcs_bmc, true);
-	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
-	if (rc)
-		return rc;
 
 	rc = misc_register(&kcs_bmc->miscdev);
 	if (rc) {
-- 
2.20.1

