Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8357C9714E
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 06:57:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CwPk0hNdzDqY6
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 14:57:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kML78E9Z"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CwPb37HhzDqQZ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 14:57:07 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d1so595728pgp.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 21:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3L4II85eG5+Ju0PiHDYgaOg83dmrN2U4zsjrFTvtVk=;
 b=kML78E9Z1HY+LqS0ocE+R+cMN1dL8FMwBoo6lyCPnO9Z8D3Vqpq3umvLjFElQSBX1v
 AYAwJhVbDwa25PuCimdjnsdS5F1lmRkJXeCxFei+Xxhz/TrP2PJR9uqmL5b4Gb4ZTmCk
 Muxur/MJCO3cRCQuZBH8aZvAZ4n65gNk2uXUTfGFWIBHISVH5fsXguZMxuiFzI6m75+F
 ogQ/QXu9tj0aFF4lIxy8tvIF7r4r5OzIXgUtUTbc3nP0wd9PWeod4szuBj/Une4ahb2J
 M4gxvM0CweUIKFRiG3yr3pg837YWTKOCxx6zasTO7tcd0b8xXnKfqTZ7NFp92IqMbflB
 nc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=F3L4II85eG5+Ju0PiHDYgaOg83dmrN2U4zsjrFTvtVk=;
 b=b8NnSARNDjnSM2eHNfk6nri7CGxLl8Ysg5rSOiLD0waGGQZsFibeg97qw4KCGJh61Q
 +gqqo+cAI02OWop79bHk4Xmvj+4mhYihF0N8icWPgcBueaphSEjffTwvvDzM9W4b3Wap
 0jhs1fOGq70UsBKpfts3BOW6Ksse/rR7VuLB+ZkFl6NxyWazb41WAhamc2E73KMpqDco
 Bhp1nb+smGxisb2aq0rLuwIG7KP0a4JbfKrJ4vixpdIxTbpCqU6TcgG8pxy5ZYqQL0l5
 q02CpomfzON9mfKDa0hd3HO0LYNfpQgcfAcetnO9NtU5vUkGfvSanrf73EbXamZ0adaI
 IxNg==
X-Gm-Message-State: APjAAAXL2sG3TY2HgYEmNxa9f6FuOot9DHlI+xFvCqiHydp7MjQTDyYO
 O6XDoVHC1VYNZsPpc2Umm5M=
X-Google-Smtp-Source: APXvYqzSOY46Y5UrW2/vAhHHp3XzP2p/mtKr9xpqX2YfPZx41r5z1RlkJxKGMekNLx4bEdSyXmD22w==
X-Received: by 2002:aa7:9477:: with SMTP id t23mr34247104pfq.29.1566363423580; 
 Tue, 20 Aug 2019 21:57:03 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x16sm12279629pff.99.2019.08.20.21.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 21:57:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH] ARM: dts: aspeed: swift: Add eMMC device
Date: Wed, 21 Aug 2019 14:26:55 +0930
Message-Id: <20190821045655.21752-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Swift contains an eMMC device attached to the second SDHCI controller.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index f14f745b34ca..25bc0e1bbced 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -963,4 +963,15 @@
 	status = "okay";
 };
 
+&sdmmc {
+       status = "okay";
+};
+
+&sdhci1 {
+       status = "okay";
+
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_sd2_default>;
+};
+
 #include "ibm-power9-dual.dtsi"
-- 
2.23.0.rc1

