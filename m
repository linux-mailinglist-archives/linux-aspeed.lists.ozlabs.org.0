Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BA453F25
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 04:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv89z2mFWz2yPs
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 14:51:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UzE9NTuK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UzE9NTuK; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv89s0KxDz2yQ8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 14:51:28 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id p17so1033122pgj.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 19:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Na4Atxvp5SDv0NmvglOs+7sRMoBgX8DxKVHfywq8TaM=;
 b=UzE9NTuKQx5aPM/Er8F26hFBz9h2z3MW38yfaBg+GTlv/nmbGiX/2+1qfYp0c6+hNR
 5yrAUEgAr5TVV/oWq3ty/wTGnV6yngAHg+rW7Mg/CspEdqu66gdhcYocQCQSSUgfCM2E
 z9NkqhBFdJxEHIBEKktPXglMXh7TLmMRj8Kb9TfOl4N4uf/BG4IYc+AT6gHLAeQvDPeE
 /4MsmUGcWHt0piqzSnOezYTeLNa2O6bG0yuVTBYCKZMb41U1CxvFQptXgKaNHPzFuWp9
 aJlQlTWyzViKtPd1PlExqxfco4vBGifK8Nd7vCnmqEWiLNRqVlWoZDHfINktYSM4fUMC
 lExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Na4Atxvp5SDv0NmvglOs+7sRMoBgX8DxKVHfywq8TaM=;
 b=GRUHN/FgBgyn5I/4y/hHp03Jo7eREn1wOvDKcwqMvwIybP3Pqt45PYvN89hhgQi58U
 ZWM5t7XVC0iUkrnxcEhbpOwGBqK8zmkcA7lH3mW1VEGroUScArnWxVyR36TNVPEBa7xo
 hQfhvrAE9kbjqbSz25eK4LtSs79BxtSYbJKkyqBz27PZWyJPLDMd0ZjNQRFvmL7lsTxF
 pmEdKZ/cJjTE85qMz70cZn+RMbozyBgli7TY4swSGrjWWfzxj+wD39leY+9mLU08WZRQ
 vhBuUas0g9TZPct+BPzHKtw14df1XB82vq7ZbBiOcugI9BfXdS8n0AnUsVcwEiUwq/HN
 /uUA==
X-Gm-Message-State: AOAM531b4x/6mpFwGzEnw9otd3Ghgx+KFJL6oRygAciN1Ftq4cMuVSGn
 1vVhnsFzXB3GT6EjKG9+nc2d3IFrqHJzNRfo
X-Google-Smtp-Source: ABdhPJyfoa/fBZLztLXiWQPqmsXg2vkFWDAFUGLgJDnaeKwWPfykFaQBXjaVoJ2Khs0bfAjvqXzlsg==
X-Received: by 2002:a63:5a63:: with SMTP id k35mr3083582pgm.230.1637121086796; 
 Tue, 16 Nov 2021 19:51:26 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id c15sm3671339pjg.53.2021.11.16.19.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 19:51:26 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.u>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] ARM: dts: aspeed: Add secure boot controller node
Date: Wed, 17 Nov 2021 11:51:05 +0800
Message-Id: <20211117035106.321454-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117035106.321454-1-joel@jms.id.au>
References: <20211117035106.321454-1-joel@jms.id.au>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 has a secure boot controller.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 5106a424f1ce..16b36c13695a 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -384,6 +384,11 @@ adc1: adc@1e6e9100 {
 				status = "disabled";
 			};
 
+			sbc: secure-boot-controller@1e6f2000 {
+				compatible = "aspeed,ast2600-sbc";
+				reg = <0x1e6f2000 0x1000>;
+			};
+
 			gpio0: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
-- 
2.33.0

