Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30235919FD4
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ffyn21jz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qH644jWz3cY5
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ffyn21jz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qGR5Sfsz3cZB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:47 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7066a4a611dso3642878b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471646; x=1720076446; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmQLM6kfiLLNztCoNImQmMNq24bv1cMMrdxlIFr9qpY=;
        b=ffyn21jzJ7K0Rpt8RNR29qnuQdh8tMgJpJ2wkwix1sj4B5hkkZCDqKWC0q9pVfAloI
         5cLyti4W4P3kD8c6+jH8L/nJ3JflJpYUOcywkHzsJbeouvhHuM8y1vWIZ6fcsaOUT4Ft
         icbOLbPfifGFZ+XWu2FbgZEK9QewnYtVVHtjqszTM4B6X9mfZg7jT3L99tnNuj3skKDO
         xQDVUHvZn8Q6LhyDEVf1wGHJdQe2O/Kp+nMs1c5ReWkVbJKl+CnZxEP0GMGs+CV9EYDD
         mBOHh6pJ3jlFCw2HBswFCEVAdn2y7Sk2VAdXBIfTtA9spTh7Sw4m5AB5Z+K61hnmnysq
         o2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471646; x=1720076446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmQLM6kfiLLNztCoNImQmMNq24bv1cMMrdxlIFr9qpY=;
        b=bmsmG2TUHQYK6yPd8QYGV5vcnzxToyhnk3+r4rz2QCfLa01ml6ILJeLc9vQ+7ftL2R
         QwO6MwB6jbvOrBbewdCcqr48hONlk4+DB154GH46I9+JHpk1Q3wBDfZwvsX8k2sCNzVP
         7iZZ3+lZi5/xn9u8XxtD9PmyEHV0UBwFxVpArPwJgxwg+nNuT3SrpfItFr88nRm1nbTg
         RW0eOA6TvC1ty0PHoumrkri03WjaIbntYNCI6lRXg+uYvOaT3kExuCWGyk1q/uVwBK8e
         dHB+hx6VXjkZfAlj0k4V2VxfW4ws2QmWbvvZbaCdQ5VoxZOFYWH2OpeezXNMhfeQ1H19
         678w==
X-Forwarded-Encrypted: i=1; AJvYcCW/Jkqg1hWCWjmyPshyzEh9eh0FZLnGUizViwQZqt+bWMJCOZ63PHkLZBrAqmWy/tD5drklImCMELtf7EXxuIDbWEyIVWTeAQY2vez8Ew==
X-Gm-Message-State: AOJu0YxPdzAk4fGiNjaVQQI6qQ5XwdpY0H1o2RqtDrRpTHBCrcNZN9vF
	xpGeutphmM3bQ61gzAENygtZ09ePVZl94KqVev32gXVSAYjA6j4M
X-Google-Smtp-Source: AGHT+IHb1g8XlOrBodiQethHKfUA/vsxZD3xX+AlO38V4lMaCSQImQ/hYmUviYtZFWQWT05xDKMsvA==
X-Received: by 2002:a05:6a20:9790:b0:1b8:a226:9a8 with SMTP id adf61e73a8af0-1bcf7e6f5damr10865467637.13.1719471644475;
        Thu, 27 Jun 2024 00:00:44 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:44 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] ARM: dts: aspeed: Harma: add temperature device
Date: Thu, 27 Jun 2024 15:00:10 +0800
Message-Id: <20240627070013.2509150-9-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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

Add temperature deivce in i2c0 and i2c2

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index f55ffe9c4d89..0455475fbcff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -221,6 +221,11 @@ power-sensor@45 {
 		reg = <0x45>;
 		shunt-resistor = <1000>;
 	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
 };
 
 &i2c1 {
@@ -271,6 +276,11 @@ power-sensor@45 {
 		reg = <0x45>;
 		shunt-resistor = <1000>;
 	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
 };
 
 &i2c3 {
-- 
2.25.1

