Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1798CF06
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 10:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJSvw4qVDz2yVZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 18:41:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727858490;
	cv=none; b=SkHLjGkmWrcOUxQbYABE4tTZA8ap3lmS+hjf+i2VPrfog1UANfRqOQ8SODv4QVH8/k0vVsvSIY5Mb8Bjakl/haDRcq1XftcmW1ukMlN0Jqrln/lIjIwJNBJl9Sq29lNMAc1Z/aZ23z/ScWrt0Dxz05dI8eQoXzo0OqF4ksXiC9qHI5zC31UMCq55usL+V4ajD3WG0gNP+8/n9t3SGxeEE3rF8oP4tXkfK6pBeJUzbwJgn2ojyl3y3p2X8O4CF/wLG1lg5XyScxaNGnB4AT0Kh50anK9ZWhGXSrnvwDH0wEllVe5cwtSoYTreDDVbutD9gjXkUufGCWns/UClZAD1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727858490; c=relaxed/relaxed;
	bh=ZkdLBGm1XB365GQZ5F1KffCkGtsoV8P41FFkFvqweKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uwo6mhdZbBvD4LxXEt7teZLR6URGXGey0wRANO2D/w/2uocEpeEo5vHAqzICNjoEThpNPPFJMkbnvrNAS0DdcaptRpR2hLm+Y/zLOgYP7moBmRIz+ZyKSsDatPsbUgvX6BCuL93pyeJ6Pd/Hm2ETbS671FPhT0+1Xk1TUFF6tILULKYIQZ6jLIxsnlSA5SJ8PBNFtwuwOCSUyJsNPxDFYC9DDbuoQU3WDZ4afcZapU0utOINBk1NFMi9B4+vSZ6FjK49LaQDstQI+JNyCKkxOQ3sggpPCLZ6UJNRjwAvyWJkRPZ+THuG9279AOkphIS+5OScnKCbOK+hVFg5YCBxdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BEAriutW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BEAriutW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJSvs2y7fz2xZj
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 18:41:28 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so2783975f8f.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Oct 2024 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1727858484; x=1728463284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkdLBGm1XB365GQZ5F1KffCkGtsoV8P41FFkFvqweKw=;
        b=BEAriutWjd/VSETbiUurRFnaSwBfyFEPqJn7Dz6iKZVjX+uSPWUWFbHBsCnVQVGGLe
         CO12hbpzqgmNC1JZMVR+ro/0NHV0KiuTURdQaRbDEo42wxY8cIwjYWHPAB7NlX6+hjpu
         /OEzEWiqDgOKueQ1Wca5pSIJURGR69HysDDrBLb1Ffy3rIbRYyvOHOsbn/U7Ls74N7Dp
         fWvO7mABMntRXKSIgOB8fJvrbkvJWa+OErVR95Kc1SXEuHGjSvwNkhWRT4jqiQnM/D6e
         r+dlk5/+G8E5m1PuylUgvfAz1ZnfHN2FurqFdER/OL/6Y3iyfB7wCQXkEhe/y9gKYRMy
         gjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858484; x=1728463284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkdLBGm1XB365GQZ5F1KffCkGtsoV8P41FFkFvqweKw=;
        b=kYyw6gjKXPA/m9YLy6+dyGxnQaKlhUucd+zAQFAWMIyLhHwNP7+vtyGq5tGVBHPwvw
         0ZjJOY0a65+TWnE4dmri+GMsLJWlDSwu7P0nyb+QcEq/pIVcD+3M9FNKNnVWmJpdTWGi
         t1R0unwcbBsG5nagkD2j5sR7NXlDiz2G5nVF7lz9VjMTN7yor3Hr2lWX/kczWtdRN9ir
         ptMXK1CPtgQLqqjEYnjzQuE7BmqewpozNF0k7KSTsgrsh/Ch0/RCumV70MJPbPAW3Sw/
         8MbERhM5KoO0q2ya+M0LkaxahSZopw+28cFWhv70yaEP+ZK2OkmoiYLcymy9OaWiO/xv
         viwA==
X-Forwarded-Encrypted: i=1; AJvYcCUaAdJXpUWtaGIN6o8WW1H51L9aC5zyszLArH9z0MH+ailgTSYc6mj6W0QyTKVsDKqZ+R5ej1p4Y1FW7WQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnFqziHkVlB6pkF8EJbsvetJl0VJnNiwkz0a/HDNWSvcyTuNoN
	ERDS0Q8NHHmMPbLEK/O1VnuqEiC/pkFRrABc2w/t2anhNgaVRDx9SSiJZ7vI4Z8=
X-Google-Smtp-Source: AGHT+IHHxXmbuR4b6X50HxVTK9A11o7DnmYPeKR05fGwinleKUdREqTk7ARPSItbcf2SaeVHMsEhLw==
X-Received: by 2002:adf:f04b:0:b0:374:c616:54b2 with SMTP id ffacd0b85a97d-37cfb8cf2d8mr2169854f8f.19.1727858484028;
        Wed, 02 Oct 2024 01:41:24 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ead833sm12332645e9.13.2024.10.02.01.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:41:23 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Date: Wed,  2 Oct 2024 14:10:17 +0530
Message-ID: <20241002084023.467383-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on IBM SBP1.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 95113df178cc..8c04d6eaec08 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -89,6 +89,7 @@ properties:
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,system1-bmc
+              - ibm,sbp1-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
-- 
2.42.0

