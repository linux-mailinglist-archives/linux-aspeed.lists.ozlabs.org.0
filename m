Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4B868652
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:48:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gCtx2LGU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3V0yppz3cVd
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:48:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gCtx2LGU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL373BsCz3dX6
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:47 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3577729a12.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998464; x=1709603264; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeUVH1enZnNU18wYfElV/S7pL59t5rpG29uXETSjnD8=;
        b=gCtx2LGUeM7SXcvKunmNp+0wPEKWMk0ocxcXE9l8uPSK+xiH3EDZKXApVpJsfAL6RU
         H+QmdbhScGTjLkwXKEA3bos7wsGTftFwHu9I7wvIdywnBzgWzN1j4FRuG/hdTh2ngVsz
         IpADd89eCrN2VCHxaDiZHOA/fDz1d3SDmqvRLSvF1B1bnUJ0MeoU8CrO4N5wmMTfwMV5
         L8XylerRvZ75BpgPADdsNtQyeBI355q4ut/tOVjh6Yf/bjYQdJmoPZWKbQkCk/Z/IWSE
         beETMf98PQBTTsMmoUVdEX/c50ZKFoyRk6CQql4vslxORWRihze6Sdm8HKNOM9ipoUBv
         n1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998464; x=1709603264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeUVH1enZnNU18wYfElV/S7pL59t5rpG29uXETSjnD8=;
        b=QoZcD5YtGvFdtsHjTBRyyczDg5rSwWHzXfwZ66oFI1VM2QuAFlzjqApQdRWpYQ30KK
         6DxxgD3xNf5iH5WExK/CVqNoY3qYhmhk6EU4yAW3vl/rYfCyWr8/+zMaOhnE5FKImNwi
         F02UVgUQuGw+b4RTIWRU17KQLGbdTaz77jVCG/HjTM53MIhW9V78EXg0kWefQVv8R/Ne
         /NWrI8un/DV/138Qk7Kx/ecGjCIe4W6q3G17EzSHo8xE/g9XP1xxjRStvDbPxiZJYmMk
         wtqzVPZuJELaXqu2At/di9CST4fClbdQ8RFmOx0uetggV35Dy3Mt3P4BAGOq0aARTk+f
         1plA==
X-Forwarded-Encrypted: i=1; AJvYcCUMzD2Jt2w+sC2pgE7OcmQzOXnbcvsoE1xLWh2olZnAbyVAwOuF5GU9FtxrTx3YS4NQ8jVhA3QAAlEIwRRgPNGN2JX2uXp7AtYbpHjbQA==
X-Gm-Message-State: AOJu0YxyQDJ9ci+051Ln2JgOZ6oqSxz3waytBxZsBxnlhAPAaIo3lWGe
	wX5w/4imHmXEf+n0OjM+OVnV8vWsLaPrLzbJ8Ki/18HBqmqNrlah
X-Google-Smtp-Source: AGHT+IF/Ku+RIpOrUIY/aJ7uNPcDkGlC4OFk6afz/ulTHSCfoWsoNZFTnnp/YaBtuRHdqfJv6tNwOA==
X-Received: by 2002:a05:6a20:c916:b0:1a1:b38:be61 with SMTP id gx22-20020a056a20c91600b001a10b38be61mr881754pzb.51.1708998464656;
        Mon, 26 Feb 2024 17:47:44 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:44 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/10] ARM: dts: aspeed: Harma: Revise max31790 address
Date: Tue, 27 Feb 2024 09:47:16 +0800
Message-Id: <20240227014719.3037588-8-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

Revise max31790 address from 0x30 to 0x5e

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 5c3fa8bbaced..7e98af5836cf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -192,9 +192,9 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@30{
+	max31790@5e{
 		compatible = "max31790";
-		reg = <0x30>;
+		reg = <0x5e>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -212,9 +212,9 @@ temperature-sensor@4b {
 &i2c2 {
 	status = "okay";
 
-	max31790@30{
+	max31790@5e{
 		compatible = "max31790";
-		reg = <0x30>;
+		reg = <0x5e>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
-- 
2.25.1

