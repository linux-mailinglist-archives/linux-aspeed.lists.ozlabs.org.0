Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09907547382
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 11:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtbL6D1Sz3cf0
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 19:59:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KL2vg4UZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KL2vg4UZ;
	dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZl6J4Bz3cF8
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:54 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id y15so1528539ljc.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EvmSxNb00VCJZUQ2SVU+l0KVfBWbEE6iTSA8RECXJz4=;
        b=KL2vg4UZuzy67obhWaTWJBuajSoYfhOQYAY5P4hRszmFJC8cUkSfFCIdFkfOxDwdNX
         z2p6kpn0otvnXicX9hx9BH+SlACWRNzctxinm8fmuus7jwQd5p04Hs7KxDjyKWO+6K+h
         swDNJsxEd1+4+QkaOCSTIV9EvW755XLs/QGVtQvzD/2aI1MmnEL5bFh7qmha+e6L6VG9
         BB9jXUXjbNlOwgw3qAdoV+7NxKVlyiPe2ETe7XGUaq/LyjaqGu1j6J10EvaXGGAmz5ZR
         n/OqlkAMDkcglPYYBzs4QP3xNKgp/AnN/OidWIQFKYZpJkrUC++/ygZ6XpCt3v/y4b9+
         0MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EvmSxNb00VCJZUQ2SVU+l0KVfBWbEE6iTSA8RECXJz4=;
        b=O97HGVrDQsfvfoT0zXGZ8Gl4koQfnq+phuZtQuIKbOyTIgKUBaDV1x0Wdsu/GGqBPG
         d9yxa/Tg2ajI30MEeVUTYRXXJ9uK/Ng7OdBG5QTOIc64ozWh1sp18yXNRlnKWUi+RWfV
         S2AQt+3bQildmo9StpLefMF9n8awRFfW5y2i5HI+u1dfEDgksJFTl5lL5oL2Dp0aEygP
         Nh4bhlQHJD2XVu/8251q7GA6nYiMnZTiecp0S7M5PqpNA3Y/elZO3lsuUBv2In0Pxb26
         Al7YFk8Nxo9HB2X6voD7UxaExNeLNTGGbarwageoVmv5t7+MlCuGW8iNiF5kucjU3XYH
         vgBg==
X-Gm-Message-State: AOAM531qO8Jyi4OXiwD2RGoK6IMlavBVJv216q9uXsxz7DJppTsCXvLP
	ITq2xmn5HC13b41cY/AMx5s=
X-Google-Smtp-Source: ABdhPJzJ64OHPxj7ndZACeTnIHCmaj+7N9vf4CxAxpRkqiT63+cr41lK9Z7L4j4pQ8QHCZmQ/VIdpw==
X-Received: by 2002:a2e:9587:0:b0:255:6e01:50d with SMTP id w7-20020a2e9587000000b002556e01050dmr26607779ljh.146.1654941529372;
        Sat, 11 Jun 2022 02:58:49 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-90-154-71-254.ip.moscow.rt.ru. [90.154.71.254])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512055200b004785060bad6sm200634lfl.201.2022.06.11.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 02:58:49 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 2/4] ARM: dts: aspeed: ethanolx: Configure RTS/CTS for UART1
Date: Sat, 11 Jun 2022 12:58:26 +0300
Message-Id: <20220611095828.1090-3-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611095828.1090-1-aladyshev22@gmail.com>
References: <20220611095828.1090-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, aladyshev22@gmail.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, supreeth.venkatesh@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

UART1 is used for connection to the main EPYC CPU. Besides the main
TX/RX signals this connection has flow control signals RTS/CTS,
therefore configure this pins on the BMC side.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 889b2fdd19cf..0354a7d8f9f5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -79,7 +79,9 @@ &uart1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_txd1_default
-		     &pinctrl_rxd1_default>;
+		     &pinctrl_rxd1_default
+		     &pinctrl_nrts1_default
+		     &pinctrl_ncts1_default>;
 };
 
 &uart5 {
-- 
2.25.1

