Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A958E471
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 03:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2XFc1C2qz2y2B
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 11:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qJkU4UQ+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qJkU4UQ+;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2XFP2bymz2xZB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 11:20:55 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id t22so13347620pjy.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Aug 2022 18:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=khqf1k3+MfYNkalxMZpYKoE5do6tLfZ/fJm+K3skWls=;
        b=qJkU4UQ+AFW9nIaysvnQnXgf/SNabIxuyEJTYq7zhTekZHYl5pahldNS9q3QWmL6gz
         r/IuRKu+nE2bY1P/mFE4IRL0rai9vBErmrZMEen++AZkhEMZUEHWfu8vYkxH2j2aR5aO
         JnUlMyVPVX9p2gS2Cy5VuPXxnIy45IYpFphw2BdqZqVFvsP3+t5nAl2aLAAobBqz3buJ
         3a5ubFPVrqVNl/+MgnZhNzOOa0eiTGvpigkW4QxN5Vwg0ZsMkbuwwB52ubxERYorSl/n
         QzMMWTlItehEiFhlXvTPkYHnjkTpQWLLrzcewPp7Bw4PtnKxcbYJA42rEhcI2IXk2GGM
         y0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=khqf1k3+MfYNkalxMZpYKoE5do6tLfZ/fJm+K3skWls=;
        b=ohLaAqRfzEUJ+F2x7dcYAgDl7y8pAR6bQURicwNegO0h3AtAAZfCJQ+FdigBksdUQW
         WqgMvTO432Ua6SDLQNd/BPFl7XNLWzJ+H5Xkd0QCLPeqw0DyPJuqeeR6WZnou23NnUfN
         1Ypu/1Tvo/5BQkTH7EXZ5VO2xFDURHw4mdvdh+PIcbzFeQpIGN/li6d/RxiRTXscYAeD
         F/F6qUPpVHtwbpljrYnShD+xG9TNIoPxwyyiasWuQmUPW9qWE4NMg2ffJhSqbBY21Tq2
         HoFUL8L2EMelM9VWBX8ixzjQIYy546AtoQZliiL6EoP0JTWgZSWXApEYrz0v5VuJoLNP
         YfeA==
X-Gm-Message-State: ACgBeo0uWS36nmwv8wGhZhkyfTmM1uMhv1q8SZCmHbHqzT64Xir814Lk
	lT6tK/1J/GXuo7RLcA2wZ14=
X-Google-Smtp-Source: AA6agR51LnBaxgTx2WgJTcm+BjiH3Xg6ee3Zo6ptWf7bD0MQA3eWreverFGPZFili+oDVkT6ma17GQ==
X-Received: by 2002:a17:902:a586:b0:170:f3ae:bd06 with SMTP id az6-20020a170902a58600b00170f3aebd06mr5791490plb.104.1660094453559;
        Tue, 09 Aug 2022 18:20:53 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id s18-20020a170903215200b0016c3affe60esm11356754ple.46.2022.08.09.18.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 18:20:52 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] ARM: dts: aspeed: bletchley: add USB debug card IPMB node
Date: Wed, 10 Aug 2022 00:43:37 +0000
Message-Id: <20220810004338.329832-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220810004338.329832-1-potin.lai.pt@gmail.com>
References: <20220810004338.329832-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add an IPMB node for USB debug card (13-0010) to support IPMI comnunication

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 9fdb3d17596b9..54c9f182f6a5c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/i2c/i2c.h>
 
 / {
 	model = "Facebook Bletchley BMC";
@@ -946,6 +947,13 @@ &i2c13 {
 	multi-master;
 	aspeed,hw-timeout-ms = <1000>;
 	status = "okay";
+
+	//USB Debug Connector
+	ipmb13@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &gpio0 {
-- 
2.31.1

