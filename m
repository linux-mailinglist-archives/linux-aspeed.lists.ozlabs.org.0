Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32463971125
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 10:07:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2KDx5jyZz307C
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 18:07:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725869230;
	cv=none; b=GT7ijop2upSLhV2ujCqRIpshLI29JVvc073czVD2rf68GJlCPfeaiAWZhme5q6pMwBeSuSgLeoJfO5Y5AxN4bXlOJyuPV6SAQoD6+bl+RiOiI3WePYt0RJaPdjSmgL1PnkJsJ80+jW+UWaqh8CUbZjhWhF9HKUbv5jP12YpYZQQmo+M2Sis0h9RO8ZclLH87d5AgN1WX3ocn6dv6BnHr+rK09sd5Fq7iiheb8xR3f2IUlEUU0XPhCQnRcTUcQ2e0AkKn4tPwokr6vG6wkamFsnDoseQh27GoOOowyLd7TiArqUHfmJKDucH9B2ByrWRcHOgGcZ/rNVziWXJPfU2H1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725869230; c=relaxed/relaxed;
	bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
	h=DKIM-Signature:From:To:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=jHdyiCnU9Mk6HEWZEpMUL+n8BPSkIkX9nw0FaFgUC0YOBYpKHGe2BlIQ59j7FKK/kQuueAiaUOEbUV9QFsa3XHRV9WTPdwOWlochY/pkkFV/Es1AN6weBe4nHjO6Z4F0PDCjsIhgP2w9Q9xUTQxvies3axgNFPUakzmQWnIc+rc509WEZ/XgyyIQ1+Y0Bhydi63Tub/yfDgFFwa6OzkzI34llO7kohTY0T+o3NcJVkPXdbi4GIwNI3xOUZcGdA5B8iqRjLunrRKt/9ACPy4eQlS1E8fXTZ2LlZv4DIylDr1OBywLgRiHPjR2PivcIeemvpfwKMXf1HXS43CBp3HClA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eo59BFq7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eo59BFq7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2KDs2QpGz2xZQ
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 18:07:08 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2d89dbb60bdso2727054a91.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Sep 2024 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725869226; x=1726474026; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
        b=eo59BFq7PuC1PQWKRpT68DcnZOrUfr/c95F2yqsf2W09vfrw3qhbvpPji+BWy5YlZF
         YZmPKmSsSN3FEjJNJbjxkwJAG9C1nWnDJ3lPOzoT0PyVwtXDDHtEroX67JPtLnPnmvYl
         RJmuZj1rAmQU7c2+JKFdLqQrBehU79R0jSpnlseoR8L3yybdqIR0J0ZeV1spLMfXPOQy
         L1OS35S3SA8nESP1PChHAWep+6XXIR7zJHfVQRWmWGVvpyrsSlWhQOUNK8KaRxx0jALS
         aXRDJFdu/IgHvjXiNdMdMmt98AOgioaQC7vUFMIYAF7jfw6tmjt3IjrTM0w4G3+b+FyW
         sl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869226; x=1726474026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
        b=ZcrKPnmBNpsEq4Rz61ZVVH27bW2vLXdwNULw/g1ffKPtVAXu4dXjnNP2ah0gLkE4WP
         zvR7VwfdhcddMBi7db5wZBhMNeo94zOqRYMUoo7KRsy3vsDjrsqoXapz+YvKxVJCp4TM
         N97TNS09viCn5BGONX7hT9xXtZTPmtjOv3boauwjLBTR+HQ3kGYVda3o3IS+NglQ/xkq
         rV33qIjROu2c8a+8JZTM/9TNBRJwgRLGVwmYxhCsFtZLny0aTkNewT5LV81n8BlordtZ
         qaF/BRgOQuG3DsPpALsHFK2+LC5wbg+I+Pz+q4ID4rD5XQwByETEy5QG/b4R4tvs5UK7
         jfuw==
X-Forwarded-Encrypted: i=1; AJvYcCUhojH7fP5W+Trz6DKwV3PGb5f8bNjz+69m5ntgsdwUe3brBJjcJbg01TTMy1hYylU+E89Swq7ldkhmCTQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzR9ewu67BgudWmsvjoJ5BkC9NcbP4G2XmIWwEsvtOX9hIDsvRP
	Jrs6Wp49kWJ6KpGHAW+A0W6cNRf+Xkt8LPmK+Qg4I3ZkIm2GyhtY
X-Google-Smtp-Source: AGHT+IEdKA0Mj8kqr2gQb9Emszupt1dYbedGxfzDQBaFa7+PrIovDCecyCTxdD7JFKncezaQB2ahRg==
X-Received: by 2002:a17:90b:3b87:b0:2d8:9dd2:b8a1 with SMTP id 98e67ed59e1d1-2daffa3a9dfmr7828719a91.9.1725869225521;
        Mon, 09 Sep 2024 01:07:05 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c4916sm3917541a91.31.2024.09.09.01.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:07:05 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ARM: dts: aspeed: Harma: add rtc device
Date: Mon,  9 Sep 2024 16:04:58 +0800
Message-Id: <20240909080459.3457853-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
References: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add "nxp,pcf8563" device and the slave address is 0x51.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index cf3f807a38fe..92068c65eae4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -135,10 +135,6 @@ &mac3 {
 	use-ncsi;
 };
 
-&rtc {
-	status = "okay";
-};
-
 &fmc {
 	status = "okay";
 
@@ -506,6 +502,11 @@ imux31: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+
+			rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+			};
 		};
 	};
 };
-- 
2.25.1

