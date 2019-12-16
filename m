Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C907311FCDD
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 03:26:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47blXH26ZyzDqXQ
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 13:26:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pA+cRFbn"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sAyLaezl"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47blWp0WdFzDqX3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 13:26:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 689E067AB;
 Sun, 15 Dec 2019 21:26:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 15 Dec 2019 21:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LMvNcL8FAR0Bl
 X1niTXZqCp51Bk+aavvUIWGJqthYZY=; b=pA+cRFbnpoLewByXQES392IPTTQSc
 SoDYUpKkgsRpJ4jCjKwJcJIoRtHUxfyPxvjFZOptkQvDAJvvGpBG9eJrWsg1rV0y
 uHnap82HcG2n2JffaTn48i77ec9m4/LXYD8EMHrJmkIuTwq+U2W6M3ljcqPiuaUQ
 AFG7vmIL/0SKnrKIiSOdc4coq8JVMF4Crbe6OPQtezw5pQ75gYztO7dEFwAXWCGC
 sQLGJv2/BFF4Gjl56xg9AHkqhBI6+Yp4Evh1XgxEcBbXt5n22sClND7VQXB2S+Vo
 zkORhdd5DrLogFqssQJ2SD2/0LUIkPpI/RkA9OReJaGU9RlgSRPpt1VqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LMvNcL8FAR0BlX1niTXZqCp51Bk+aavvUIWGJqthYZY=; b=sAyLaezl
 nVDa7nWa/lv2KmmTKv+iVaX8/aBXtMuolc6l5o7T+rKwjOUb2HmFlOd87KBTNXRe
 phiIRXjTjiUBg6BC4TVWARHUEeLcvRKxwXTb09ot4KV/7TC1Y+rR6Xtb/NXtlOu+
 Yy0pRqUVYfBDD0JUEREi1gJm/ooTzCS7g4KXNvquwEuHE4LKI2IVtco9GjKEh3ET
 AUQoG5XaeshjGjyDQrF88EmEnsnqbTYQLoeqGiqkXMa3sG+O6zGlEKN05TS3UdQc
 3G4ZfNB+o+CJhy6D6ugZ+Rr4sFPJnlzj7UoVtB/RiUp86I9r9bndxMuI7fs2L6gk
 ekvHRHeCn2CJBg==
X-ME-Sender: <xms:U-v2Xf6AQiqUufcV_jnLE3Avuin4bP9kxxMx6EGXAYfVauVzIxsdeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:U-v2XZIVgo2FIv_cN7HNg_92Z50Du8rFRhcsbl8TgYMkuSF5y2dP7g>
 <xmx:U-v2XRdIB2CrZYlEGDY4vtG4NIhf_Ia20TdbuERk-Kaq_fnbudT4tQ>
 <xmx:U-v2XUdlEeSWBqbRUI8D7nJVJqBkpo97-8vloDnZHmGfiUlLnPOdpw>
 <xmx:U-v2XXL7MmRPmlLBoMOoJnPT0zvIzjCkvyfY85Q0fWNoBnH-iacL4w>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5B4980059;
 Sun, 15 Dec 2019 21:26:22 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net
Subject: [PATCH v2 2/3] ipmi: kcs: Finish configuring ASPEED KCS device before
 enable
Date: Mon, 16 Dec 2019 12:57:41 +1030
Message-Id: <c0aba2c9dfe2d0525e9cefd37995983ead0ec242.1576462051.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
References: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, minyard@acm.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org, haiyue.wang@linux.intel.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The interrupts were configured after the channel was enabled. Configure
them beforehand so they will work.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
---
v2: Update the commit message based on Corey's suggestion

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
git-series 0.9.1
