Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A7802B67
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 06:43:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=grD3EX2D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkCJq1BZ3z3cHf
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 16:43:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=grD3EX2D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkCJY36jwz2xmC
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 16:43:40 +1100 (AEDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-58de42d0ff7so2475351eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 03 Dec 2023 21:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701668618; x=1702273418; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfXkJ8WdxxOvDNDkUc/lSpC/kRqYJbY1KuomsftLIqM=;
        b=grD3EX2DO4Ta82ZTRlHX39rfnRj1xlfSx5QjmQ/ek8xBajyQD7cqhCdbP+DSv+RHZY
         UM+FdC10ZMNpEw+4/DmOh4rp6uq6siOg8kl0wDNXIvicXkhFne4dFCYwjd83ibCosMW2
         9WPFhaTaLfE3zNTu8rci9yyrHonZYE4hendRt7WmEwLnceRPwvmv0MZouMfW8EPD7oxi
         BoPr9qPHNxP3DcQ4ZYQpLPWv/eoa0tEFr2mp9sHobQQtIxf6OtEFEZjCbP9gx3QdeCrR
         JKm0uHdfHyMlb0l7XqBy8+01N857eIEDFSzqnahcxoOH2h6vg7aaMxvyN29gZdr6H6zd
         7x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701668618; x=1702273418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfXkJ8WdxxOvDNDkUc/lSpC/kRqYJbY1KuomsftLIqM=;
        b=aj1y+bQh8yrZszOAx8302qA57+sheWfzMQ+vQiTNvQfBN22Ry+A8LY/hH9BXzidNn4
         8om+5TtLMjistlUbp04S51NmXJ30nx3FXMVM3HvMODMZ0X3M91bRzgeLhHuE/Mp8koVR
         I9/DOs6Z6Cz/UylA+gH/Bdz5zeoYM2X3YjdShYnnFh/+2gnH5EUP+1N221hKnDHOVRSR
         LPndx6k/d2sIQfelA2ym/V7su91G9PKrzxkDXAbfDHXiEZcN4mRdwgcv1fgU5NhqM+EL
         G0wMiIuvxrc75LbuqU4YmthmMx1xnteyT9swKg+ICvVzlxNHuOf5t/L0rDiVr8kH7nXI
         tBag==
X-Gm-Message-State: AOJu0Yztem7GkqaHwmlRMsAncXM8xMMDZsFWeEkiL1LYLRFV5Xvh6J/r
	696IVBpY8/KO00CDVdqLYmM=
X-Google-Smtp-Source: AGHT+IGazJkcb74hNfGOAloGtjoXXcRi4esq7e2idv8LVE/U9+E5O487mwYoNj9pXjPe5rEW3rweLQ==
X-Received: by 2002:a05:6358:50c6:b0:170:17eb:1e2 with SMTP id m6-20020a05635850c600b0017017eb01e2mr1323126rwm.37.1701668617662;
        Sun, 03 Dec 2023 21:43:37 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b24-20020aa78718000000b006cb60b188basm6706655pfo.206.2023.12.03.21.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 21:43:37 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
X-Google-Original-From: Peter Yin <peter.yin@quantatw.com>
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
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Minerva Harma board
Date: Mon,  4 Dec 2023 13:41:30 +0800
Message-Id: <20231204054131.1845775-2-peter.yin@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204054131.1845775-1-peter.yin@quantatw.com>
References: <20231204054131.1845775-1-peter.yin@quantatw.com>
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

From: Peter Yin <peteryin.openbmc@gmail.com>

Document the new compatibles used on Meta Minerva Harma.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e17b3d66d6e5..20e3be8d8c78 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-harma
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

