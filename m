Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAAC29CCE1
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 02:29:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWFr4wKmzDqRp
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 12:29:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RpQ+Mlo6; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLB7l4WRJzDqLr
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 23:38:08 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id h20so1555165lji.9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vahP35hIg4Z9TX7Ulxw+JLPNjil+mWhfbx0IQp4z3Hk=;
 b=RpQ+Mlo6+D4vhkapHBOgMWurkzcLiQzSs5ACIKPeZXZobPykthQ+RLo7bqEd4UZgSu
 j+JJHJsXyApfvZL7P3wNe9g5KIQ/Xu89mnTzl9Ci9VoCjW8DHvvH13BHBozBUT9j0I+s
 U8j7pcrWKV3OUXv7uT1roALobi/RfgIktRnFCcWyzcAg4R3kBi/dmDSglEE0awySgraV
 9cdWG56+vJXUw+zr3avUGWg3abyIN4cyxSrSsOI3tXij/bxprUsP01mvqJ9TPiwr/CvA
 uyZSmL69oLkD2wiN00QYdF6JIY9AijgoOvqEi1L4niQdFtyDdjzLSXJr7jr+S98IQJEc
 Ldbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vahP35hIg4Z9TX7Ulxw+JLPNjil+mWhfbx0IQp4z3Hk=;
 b=h+DD0oyxZNHF/dXhEHLOxFx2BnVgivki4dl30Oim+Fnqn65cQFneupmu3Z6XRRI8W5
 iLwvsNQerSqsv6+vEYAaQAXacrg4NUhL7h0qWLZ9vCxL93R0+bNx8H+u0Z5CPO1XgcGU
 P7L06E2CdWrRyddQ4gqaAnu4mPoCAaBjqcByHHVZkA1L7j173i2kk/4BD33PZK7/xH6J
 JKrhPRAj62/idsRmhjXmnsNDK1KQCrCT7rcQfdFRwxvakR63fcZo7HMsy2nnWOOpJzGS
 BxLgCv/toh29pcONkmOEd0yuKbesb8n9Hi6sLI2GkE1eJRo6k9/Wogj78Bg9E2S6OXuN
 AAxQ==
X-Gm-Message-State: AOAM530r/AiZ3sbQQF1VHFAccPM6IXcJncV33fePfso1Wx/blZqBtNo2
 nBP3tfkIA6y7VUsX6go4S6c=
X-Google-Smtp-Source: ABdhPJw+G0h55774/2Dna177AbD16UbvkWwJWYVmHDifFEnaYenPakmczFrXvoTkjirCT1kIqPxMNQ==
X-Received: by 2002:a2e:b5c1:: with SMTP id g1mr938842ljn.305.1603802284106;
 Tue, 27 Oct 2020 05:38:04 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id e15sm49132ljj.60.2020.10.27.05.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:38:03 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 1/3] ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use
 v2 binding
Date: Tue, 27 Oct 2020 15:37:20 +0300
Message-Id: <20201027123722.2935-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 28 Oct 2020 12:29:33 +1100
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
 aladyshev22@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, supreeth.venkatesh@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

KCS nodes compatible property in the 'aspeed-g5.dtsi' file was
changed to use v2 binding in the commit fa4c8ec6feaa
("ARM: dts: aspeed: Change KCS nodes to v2 binding").
For the proper initialization of /dev/ipmi-kcs* devices
KCS node variables also need to be changed to use v2 binding.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 60ba86f3e5bc..89ddc3847222 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -139,17 +139,17 @@
 
 &kcs1 {
 	status = "okay";
-	kcs_addr = <0x60>;
+	aspeed,lpc-io-reg = <0x60>;
 };
 
 &kcs2 {
 	status = "okay";
-	kcs_addr = <0x62>;
+	aspeed,lpc-io-reg = <0x62>;
 };
 
 &kcs4 {
 	status = "okay";
-	kcs_addr = <0x97DE>;
+	aspeed,lpc-io-reg = <0x97DE>;
 };
 
 &lpc_snoop {
-- 
2.17.1

