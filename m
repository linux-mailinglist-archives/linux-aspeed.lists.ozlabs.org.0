Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 904789984E2
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2024 13:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPS7W47jVz3blH
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2024 22:23:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728559429;
	cv=none; b=YivEQ9PjehwlaNMimiji45EWDscA2Tal2eTqPkQPvzOCNhv/T6IrtYPG27G8BVM+oEH285Ttf6gfgRZZLRsi5ibhoACUF9m4Jv9hCChHbZtbEYmmJ8xEspBQKGiKo5HP1SqNyKf+mz+9Yc3HAPVXVJaQ1s519C8jgsvKNyialMGeIOj8Pd7ZCuWtUpGc8ZhXJhxyQz+J8BSY39mMPyUkUoZs9QoTUVCEpMZY3cOA0drE01KA1+Oj8/IIvM+f4oLpBjBGe1qjvEM/RGJkwVDgrvPqsOhKFIntaMkHkjpBBhj/s+Hu9RhvDarH7okc3gP5AeJ9SD0NrxGyDHHvaDygZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728559429; c=relaxed/relaxed;
	bh=8qfJuw9pHQcCV2tXijS5mDrRlpcbQjwcuPA1DQvQPNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqP25ArfOqJno5aE9JyKO23DCm8pi+DP+ynqlD0760MQwI5BKCwioaqhS2U97yznJE+WzWmGoWKXrMumqJhHHO1XRxwBzk4ndR2bQ+j7QxXzVt+BzhkMBMzVun2uyD8K9qYjnXUbbRtBkg/DiofFK4PFgQrbcYGQ23tWRMvnnN0R7O5GHN0rHCUuXNJFs35oSomb3jmgRU4JpmiBMfY9d1xym4IOlf8UgYvhRoDI0T8nUzSWxCnBQrKaUUZVWH+aeQ/kmglbdIgLELKJ4BidfUpcIbyjTBRIOPEB05vKb0oGw692TjaeiP7EkLtO7V+t4g8WzKIEZZDPFuCh4MaR0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=OAVlLZ9v; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=OAVlLZ9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPS7R5YCGz3bfR
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2024 22:23:46 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d47b38336so438721f8f.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2024 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1728559420; x=1729164220; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qfJuw9pHQcCV2tXijS5mDrRlpcbQjwcuPA1DQvQPNA=;
        b=OAVlLZ9vi8WuuBm4rzwvZ7gVEfTihW0nOWKk5iKW2OFoH8RjSQ+8tdGRDiYaKrQw3D
         FpqVmwNq7QI9cuazQ449LNmnoQJ6O1PK2d0ZM5FN1WteZZSvP4hHVsBejGjJOlTZ1o0V
         FE21BOemrycxKsFW83UMXVzhSSFhRAeykFkg6hI0pfIWbnUknzosLhKmYcCDfesnXYUr
         PHGiiO6bdT7qptpbm0DV6ToBNjxgA90Fly+7ODLuiwmmbgRe8kvl6pRQSE7PvcZX5Hpd
         oEArYuOmPuCK0Ag5l2i80gkkrVR7PRXZimGwSKOnaVnkz4KBZXbe0pX8HTG3h8GeYQvK
         ARpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728559420; x=1729164220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qfJuw9pHQcCV2tXijS5mDrRlpcbQjwcuPA1DQvQPNA=;
        b=DIlUNsRtrhZEtrcvRcz9cVav7dJ99Ncrmw+S7RPYlPB5Rd0xhgHAQIbxVJoVtoDjEp
         xpIwUxyuDttlpmHYJ5oEFRJwK48xd0QqmA6Z/fUL1DJsNaFCc9qckYvYXPY+8xvJl1Lm
         s9oDJUwLN/o4bqkoBIIHahTPfDiIi4wao8YTz0J92LJzhFdGjNruSsDOeEj5EHZ8wwCa
         p2Tb54+jUqlMgR6RNJwjmqKw6QfHFZjll7CbQLUWOeo7mSFdu/1ODRk3NCPc2fHeGGk9
         mmvVFAADAznAtvgk73f3wWzkSbP2o+lwGHkQA9el5Lr4JQ+phqNvLOlIWR4717jNF8xb
         UTUw==
X-Forwarded-Encrypted: i=1; AJvYcCXwWyygu6eC/eP5MtvGMi1OEnRvbeT5jhytpXH5aqz044cPfd4BCne9EsBaPzxDBfZpeXtihqkuxlKBhWk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpC6RKv/sNq/GRP+px8R3rBvyBqWRq2tjHpj9Sl0HlL2A1ubgA
	dUeM8gYW5vFjM/NJJO9D2omQYSSixiEzN2bL1sXMCh6Kt2RpmGjBP5tczd+cd9o=
X-Google-Smtp-Source: AGHT+IH0Vw9DArkGqysshRsRh+1TVUr/gLVYh5xxCOXj9zpK/lUtCdEkscRNDv0C5ZugXkPc3DUS9Q==
X-Received: by 2002:adf:e904:0:b0:37d:5141:ee91 with SMTP id ffacd0b85a97d-37d5141f219mr307476f8f.18.1728559419903;
        Thu, 10 Oct 2024 04:23:39 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8ab6sm1272727f8f.10.2024.10.10.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 04:23:39 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Date: Thu, 10 Oct 2024 16:53:31 +0530
Message-ID: <20241010112337.3840703-1-naresh.solanki@9elements.com>
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

