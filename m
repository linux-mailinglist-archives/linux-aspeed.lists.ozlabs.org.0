Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341B944FEC
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aBZzjoWL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgJ68sCz3dVx
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aBZzjoWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYg10HqFz3dTs
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:57 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7a92098ec97so4848083a12.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528235; x=1723133035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i53cLyoOWskUbqWkTIcWB8akUWR3OQ8O+64UE165czU=;
        b=aBZzjoWLubOViA5k63pDsHav6PpSqGFUoHhoGFcvMcgj/MXF9tfnuUrIw2X9m2l+oP
         jaghB1hWD9po0vFQ3YJwWrDgPoPNLmymDUoEFAksjmk2Htt0F6qDDol/U2iEoyo3Wl1q
         dE/zgVk+vsPC68h7kuP745FmJYydzrG/WoxjzgDMwmdkbwkyGSbwSEoO3viT6VBNdloO
         EyMF9z+WmwdVfnzzGW8D6GUD2PmU/fFWdHEiYJVxprCQtUk8ll9IM5fzC8DlHIBNFnqO
         PzTy9SSN7bL1w43l18KUn/YXgy4wuiAKAPaVtl1GRNKDDtYr/iITERj2VIxTNTCkGFxh
         u5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528235; x=1723133035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i53cLyoOWskUbqWkTIcWB8akUWR3OQ8O+64UE165czU=;
        b=E2i1IMoxII4IEujPgPjAFvD+GzQCYd6DVvsiLlOrAsRel5PUiEoDFaMIf6/uAcAWxq
         qws+w25GOc8iDWD5s8kHqte7fEut5qDf7D+1sUQ8MhMp1ZMyiRtf82X7t1I6pp/Ap4xl
         lWNOq+pjbYzX7G5OQI402C3s4cdJtwhuEyZvvb7pKDNQZJtS+fsuR4h5xqjSpqvqk4y/
         5TQl0uIKeSOT3QIHQjl2VYaXRzCzfN9FaajwCeU8yAdl9AkZoWAqqmIts2M/PmXIcclD
         bbjkDCXn5tNBsNMqQWPznZo83XZHqg79xN5Q4QZHq2QyNvP0Zv68aKctNWcEOuasflxO
         YcJA==
X-Forwarded-Encrypted: i=1; AJvYcCUg3evYqzM08uHT2yoV4kiGHXhFiR797FczqA4YTTLcfCPvZRcWLTg+nY76PYvDbVw1oIqwxeuUsoY+SIaR0Bp25pbNHGkFj/CqXupHAA==
X-Gm-Message-State: AOJu0YwyqBaZ4ZilQgDz+PYA2YyDGWEuypoT7MLorzdRadwHwrsDT3ii
	+TEUpqDHIyKhvbJGuIYo6EopPa9JdD6lOsgoOYNe7WPPhGnfp6IcgyUAQQ==
X-Google-Smtp-Source: AGHT+IF51Wm1Fa27JRzifXEOI/YiZwqF2TWAqItZdy9cFpwF/EfTGbqgQ4b7xHAjLtWCOT8kI8J3pw==
X-Received: by 2002:a17:90a:1bc3:b0:2c9:6ad9:b75b with SMTP id 98e67ed59e1d1-2cff9559d82mr668031a91.40.1722528234347;
        Thu, 01 Aug 2024 09:03:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:53 -0700 (PDT)
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
Subject: [PATCH v3 05/11] ARM: dts: aspeed: Harma: add power monitor xdp710
Date: Fri,  2 Aug 2024 00:01:29 +0800
Message-Id: <20240801160136.1281291-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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

Add HSC xdp710 device in i2c4.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7d809f1636d6..77eaa89b5eb5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -329,6 +329,11 @@ power-monitor@44 {
 		reg = <0x44>;
 		shunt-resistor-micro-ohms = <250>;
 	};
+
+	power-monitor@40 {
+		compatible = "infineon,xdp710";
+		reg = <0x40>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

