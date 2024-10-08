Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7099466E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 13:19:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XND7p42y5z300M
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 22:19:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728386388;
	cv=none; b=P2+C+0y+eEaJKrOJWsbmrF2lCs2Ex4+dwlaC/PvqnM4wPs4j7UWhxrm8pil52EVyvmqFbgSmTFWnk5WWCw7yVeLSvgvlUZyKfYPiey1f7NonUY85Ak5ZypkTLpoVybL2TnGkN6AOMBWl8hF3Nb5atv61gAPF+SifoqXD5AQnp5BwVx0C/avQ+W/YCFl58+ExqT9pPDcDrvTngjV/JMW+m5LOiYBavgooSHJETsu5Cjpc09DHXzQCHQxYf5wzY8mH08OfYrJXoBDXVWALUqjOk7Cj6wwCzmj+ixsGvpfYd/1lSLGYkejxd6OKYJ5yXPEqJcpff7j+La1cGFVHuV3K8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728386388; c=relaxed/relaxed;
	bh=8qfJuw9pHQcCV2tXijS5mDrRlpcbQjwcuPA1DQvQPNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYfAFaCfPwZhmuvW/iijj9qc6R4Va7Zhul+8kzkc4/wQea1ohyn/JyOV4HuBCNQW50l3QBBPeyUOFHe67pRnsc7Y49BDr5KPNDPq5ia13cG9oRI993ZC06z8dmFeJjFvkmZqk8GEYB/Vz8CLL5GMCcPbcLi4R5cIy8/tHdDBXrf71ci00oqwcxTA7TbTYNBqwP1dg/KAl0+uFnL484i+hPyf6NCOO9bWoGO1fvUNGmtdxSlcx6uKRafn9cfJEIWsVNVAp0JjlB8FbHo2a163c9SzZpHd/Mqun3RP+2ln+Bx8T66syOjc3Y3rB6+8QTZIlCf1Fzyn7qcORRWnhyM45Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=dx3FbYbE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=dx3FbYbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XND7k5ZvWz2xHT
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2024 22:19:46 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so56036995e9.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2024 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1728386380; x=1728991180; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qfJuw9pHQcCV2tXijS5mDrRlpcbQjwcuPA1DQvQPNA=;
        b=dx3FbYbEpjhNwkYKs7sPe/Fja2ee3jzKGFxw7sqbIKsLhSRukbA1rS6pjLa/p1sXP+
         jTRRz9pPLynuQGNsl7ooRTxZ97mVs+eZMdIIHvVL7t8QmWJ427jIQyKpGsyoK4hrG7p+
         XeEMuxoU0VYOLNgtwNm0jsiGCsH9W9S5rpTOSdpqV1GKQzFP+6DrZTAPODv8nNTOoPHU
         r1gBS23Rh5u8fUjrCrwV897Nu7YL/Sg6/wk62QNMxSPZPy0chOnTQOC3ftQIOIpUJGHQ
         NGC/DGEaina6qM2Yk+0ni0s42vsIa+VLko4j7Eg1JkgtHPh8a7BpwcWHTMrPJqSMhoyR
         A0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728386380; x=1728991180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qfJuw9pHQcCV2tXijS5mDrRlpcbQjwcuPA1DQvQPNA=;
        b=Tzv9jQlc3VQkSua02jfR7J7GT4mllr+Hu0UWTnz6JHnk6KJjvInaycx/9acfK7rqps
         dn3Kl3DTKz5mS+shBKAsF8t1P7bvJrEwigV5LcxShU/RZ2ntwSab24XJc3IMJdu+MrDE
         C2kqiuondI8kB8wIi4ItzPt9r+AtnOfX1zKLyXKZwVPVDpQ/apk6YDYK3jbaMuueM8/q
         ObajNl2tDhjIeouX0XYQlurfUmpK0JHQVs0XJ8J0nTHoREkIZvBkkBd7SZGjcLQg59VB
         xYWcke8EMPbC6s+yxyGenEtqtnRO/Vs3Y/oAQM/u4LkC4dY74+Yta5aQvUZ68bMMUQ0/
         Ohiw==
X-Forwarded-Encrypted: i=1; AJvYcCWA3owH3jahd9oeS1ZuNB37b98xiIBadjylauY1YRsIQMqsIARvuhGrllz1cFw+i7FuprTG9Exw29LNN88=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXTtzq3WM3LWLDAcWBnM5HW2PWZe5JiU+9RcvWgAnxrLYNQ5Jn
	4F5wy1AMKqZ3QoKV598Q/6W2Pnp6Dx2TQdk0Dy/+sCFWdKatA3q1ix35BG7pvHM=
X-Google-Smtp-Source: AGHT+IFm8bxA195b1uyZp9jktngQkPleO9g2tUo+kmM7B5+LWoZMgvYU6JocHoSzi44P0WUqFnE5vg==
X-Received: by 2002:a5d:6649:0:b0:377:6073:48df with SMTP id ffacd0b85a97d-37d0eaea921mr7981155f8f.58.1728386379715;
        Tue, 08 Oct 2024 04:19:39 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695e462sm7897780f8f.87.2024.10.08.04.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:19:39 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Date: Tue,  8 Oct 2024 16:49:18 +0530
Message-ID: <20241008111924.1865857-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Conor Dooley <conor.dooley@microchip.com>, Naresh Solanki <naresh.solanki@9elements.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on IBM SBP1.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in V4:
- Retain Acked-by from v2.
- Fix alphabetic order
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..c79c74ab3d78 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - ibm,everest-bmc
               - ibm,fuji-bmc
               - ibm,rainier-bmc
+              - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
-- 
2.42.0

