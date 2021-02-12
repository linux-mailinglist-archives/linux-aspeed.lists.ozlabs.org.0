Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB9F31A295
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Feb 2021 17:27:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dcf5w6XbmzDwqM
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Feb 2021 03:27:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SQTDafnT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dcf5r4DZ7zDsZ7
 for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Feb 2021 03:26:56 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64F1660202;
 Fri, 12 Feb 2021 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613147213;
 bh=OwGW8enKxldd+NnFAPWb0VZSuZRCA3SF/WgjgHhPiiY=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=SQTDafnT8McoSJ5ZcbYQEDJhip3MkEiOZUcWfhoXXp1zQoRv0mPtxIWkoMdQ3qN+p
 yQM+DR29AtgFIVU3L747LtfIe86KUEjydKOXuwpq0FbyqoZQcHSRP71O83XeBv9jad
 NVM5HVYEJQ8H0EgKcGuaUrFQWRyEe6IlMfTXh5Uot14RlPQQTiM9HbPlt5o0KBy8Z3
 nVuX4636W+cnNZwrK388RxwL07dOR/XDvVF9Ginw4uCQDdZPiBPTxIckkNIgQ3AD0X
 v6+r9Uo57qbabkmO2nqF+EHeqYgMHeJXfgdYXPx8Q5JA0H2SCocXzfdLWGWPCGndf6
 iNaYxEVUTxzaQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 1/2] ARM: dts: aspeed: fix PCA95xx GPIO expander
 properties on Portwell
Date: Fri, 12 Feb 2021 17:26:39 +0100
Message-Id: <20210212162640.66677-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The PCA95xx GPIO expander requires GPIO controller properties to operate
properly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Joel Stanley <joel@jms.id.au>
---

Hi Arnd and Olof,

This is 5-months old patchset which was not picked up by Aspeed
maintainers, so could you take it directly?

Best regards,
Krzysztof


 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 4a1ca8f5b6a7..03c161493ffc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -121,6 +121,8 @@ &i2c5 {
 	pca9555@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 };
 
-- 
2.25.1

