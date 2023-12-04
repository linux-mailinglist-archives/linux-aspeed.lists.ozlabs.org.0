Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2C802CD4
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 09:12:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VAUgVKEM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkGcf3JNtz3cRh
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 19:12:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VAUgVKEM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkGcQ3w1Sz3c3H
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 19:12:38 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c65ca2e1eeso296168a12.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Dec 2023 00:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701677556; x=1702282356; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ7Lr5hFVMmxrz8Ra1Xc41SVOA7nLYF8fZCEE+nN5AE=;
        b=VAUgVKEMIKEw3yOsJ/ArtEv3YHW+neTx7tVlzf0VMBit3P3kiXYJHXFuzJJz3YXYhk
         uwl8dhHmohWhqfs3qfnZzfxzuIWUhbD9K4Go+lvzw+zOfBgDuPF+y0DybHCorPAekvJs
         9ODXrv7HHlPfnlR3EX0NHlOVXVkc/FgYoCPJvPlZF8imB3Xe0s4br8NDhkRQLXwpxhV+
         EAwWjFGvGdXivKiYnVzxAliK5YslgEK12xLVCouQbuVFPHGgkciIfeXsMxmDNLNIYr06
         iC0aqBwPrQTwcZ88WSqAApjQHsuiIyHU9rpXzCbDEwBBjnVdIskYkhAk8+NwrR3z10Ik
         a0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701677556; x=1702282356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ7Lr5hFVMmxrz8Ra1Xc41SVOA7nLYF8fZCEE+nN5AE=;
        b=AijC2g3ID9A0PzFAeGkS3yDlr/nR7Ovzm9TbYW3fYWjYJZGXYmF0VTypU99Dx1LvhZ
         WSRowIJAOecUwu3iMdRKoykychNo8GACCbSN45D65JsIRAT//C4UxK7D5fhFq8L67WJk
         YBwRTO+20M/lgTqIDM0xJi09Hx0fSZeQdU5kw4XYNNiq+2wTvkUmvBYNSXk/IeJho52r
         BWDPkFiopFrWHA/iGO+4O9SVq3RXjFez6k8wiKrUP5x2bXB1xCUPBz46DcaVkUYr2hYT
         09/vD3kJ5iL3QlpOMVbWfKZSY8Bi7mYmdCHTx5hvXcyO8Em89EaNViEHvM7DP8IViqZz
         iXsA==
X-Gm-Message-State: AOJu0YzHlJTu7x5w4WQk4gTqhZUttzxQkKUcX7MfOSn8nii7Y/MG9yWo
	UFD4YTogBaRUIV+TOAduqSU=
X-Google-Smtp-Source: AGHT+IFRUnSZwaxc53KnhmuBatNNSPyRv7A+yWcSJcX91roeL2WcbWsgLXxs/nA/Y/aspjNTCXxJEg==
X-Received: by 2002:a05:6a21:1a8:b0:18b:30d1:fcab with SMTP id le40-20020a056a2101a800b0018b30d1fcabmr1063266pzb.59.1701677555940;
        Mon, 04 Dec 2023 00:12:35 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id u30-20020a056a00099e00b006cba5c61a01sm7059864pfg.159.2023.12.04.00.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:12:35 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta Harma board
Date: Mon,  4 Dec 2023 16:10:28 +0800
Message-Id: <20231204081029.2272626-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204081029.2272626-1-peteryin.openbmc@gmail.com>
References: <20231204081029.2272626-1-peteryin.openbmc@gmail.com>
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

Document the new compatibles used on Meta Harma.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e17b3d66d6e55..fac3cda3f4870 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,harma-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

