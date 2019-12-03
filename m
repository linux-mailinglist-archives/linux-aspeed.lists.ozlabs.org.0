Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9010FDE8
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:42:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S1pp0WPszDqV9
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:42:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K6UKXHMt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="x/m6vK9v"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S1h75SrDzDqSc
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:36:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 977F26E85;
 Tue,  3 Dec 2019 07:36:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=AOngRiTxh05CH
 c+UEUsafbobBZ4W/uuHTrMYg0GNvQ0=; b=K6UKXHMtMTt+v5izg/FIaaOlfWIFx
 QKYJDjdBLuiPwveORL/Z7ZLqKLtMCxJRHJKBFe3S7YTLYkgPg/R9XF3ttt8hME1d
 kLuIRvmd3jjzfMNKPW1r8sYa7MY6COKm9orTx3D8AmY7J3UcU2FucQwOhZ4D0knV
 4ZjtQ8WcDbtBnak2CZlWdq8m+1oACZ5YoWtxKlkjNxuhFrzc+AEdljhYu2A1DMuz
 JZcYpkC2e1TDhX/s1VZ2N5A+DACFaKATb+wwD7miq7Kq03T3vsLwQK9G6+3rI10j
 U5+DhpevETDEW5Kj4BY3H6eXQNs7/rFf3VDPk4nBIwfQKtfcPMD1isIxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=AOngRiTxh05CHc+UEUsafbobBZ4W/uuHTrMYg0GNvQ0=; b=x/m6vK9v
 aD6N1e8pg1RiacnJjH5ClB/vRaIObK4ns/1Mshh/9q+gTrY6xvBV68m/xCwRabYz
 rnoV0eUwo+4Idx2DmWz+mC0NHAwE6k/Ko/DiNNBNvPVKTrNjQA/zh4J1O/kzhO+A
 b2W4eYJIUrdo+m6xntQI7fGRV7N3Ms7sFGq69sXPQte9iel94Boch5XOmjLcprlA
 2QeHA+g8JyVU+dX3/QHb2/63vC1ddaIvOcYi6qGzwkNvQZGIRT5TnfrY8R2TTH58
 +oYynpoIXNYE1AI7rvcmU36W1wL8G9ZvOoNoZOvoRjcyWXz3LEz653FoYfwlylNr
 J1/+YV9rYFuSWg==
X-ME-Sender: <xms:41bmXdQPNfT-Xk4pNrzu3Qjh2adO7GnC3PcHJVIAreIvMRD2wuac7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepudduke
 drvdduuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:41bmXaMRxaaCkffEGZTaXDhawKltHxAWoW13bcJs5prKeWvjuLuuKA>
 <xmx:41bmXfkNoPeEBXK_pq_cNSN9vq4AV9NiwPQQyMm2rcVPBlUORF_4-w>
 <xmx:41bmXYaWfX9VanLCyYhINZjLp49kbbTNITPv3c8bN6ujn9363MCGrA>
 <xmx:41bmXWIW2rkDzbb1WnNe4fcZdtpq-Qcr4VMMMJ37_w4UQEblksPOXg>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C20430600D2;
 Tue,  3 Dec 2019 07:36:46 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net
Subject: [PATCH 2/3] ipmi: kcs: Finish configuring ASPEED KCS device before
 enable
Date: Tue,  3 Dec 2019 23:08:24 +1030
Message-Id: <84315a29b453068373c096c03433e3a326731988.1575376664.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
References: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
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
 Haiyue Wang <haiyue.wang@linux.intel.com>, minyard@acm.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The currently interrupts are configured after the channel was enabled.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
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
git-series 0.9.1
