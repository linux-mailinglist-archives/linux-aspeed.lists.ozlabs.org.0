Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC4807410
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 16:55:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jEdn5Qtv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slhnl3f4Wz3bPM
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Dec 2023 02:55:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jEdn5Qtv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlhnT610qz3bPM
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Dec 2023 02:55:24 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso4542714a12.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Dec 2023 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878123; x=1702482923; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8GAW3TyMQDn0zU5OEduOYL67Qvlrqm9celtiaHSioM=;
        b=jEdn5QtvcshPFXwQgT9/eVdXJtTk+q5Sygfd53uQxpv40kKlJmyeb0D8yDDEf/f0jt
         uMMakzj+rAS0ZvlDpyCafBNL6LvZdqok4pjedK6ZjxXewNovIhaPsRHrLlryDR1k3fiz
         0vSK/Ff4CjatG+t4Z+AyT5ksZIqnh6QtRRsYfBLYdJfz/xPEKqg1m7ANjQ1dloihbiqt
         KulRhHpMLR/cwY4uSR7wK0Csix4f1BGwb+th8rCJrcm1MDOQRHdMhZt71+PO5rjfKSs4
         ePe51Rv+x02AjPF4OJawjmiEZ+V521CKH2Jurq/os9Qi55Ui/uqwvNl/c9FAwkaR+AtL
         rfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878123; x=1702482923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8GAW3TyMQDn0zU5OEduOYL67Qvlrqm9celtiaHSioM=;
        b=LbH0UeY6PyIRJ16NHKvcu3ZtPIm/nxUalIwTDDsItXcA2ZkWtLIcsCtaEYZksK4rOv
         1qLjwGMoOP0YC/6wq724NFq5/GEg5SzySCJHpiFg4AYZ869aCatvZvYj7njAVaAl8C+C
         SM4SwNKgfV9arNLHGTZqhdaUXOBT+BZVv+baAYa2nmK2eXU97kp9H9rTQ4ELCY7Sljt7
         70OrWXZQu1Gu8LfIV2A1OnjGMo2eXBrnTyIQBrgz5i+qXhikzvN7nGe7THXrImkMiR8F
         86+8GI5PBBGuJFQeAnez30NEHk9aBApt8WwDsnLN2vjzWWIe6EvAtvWAMRvJ5SA286YQ
         lnAQ==
X-Gm-Message-State: AOJu0Yxj7dnM8au6oP+1cPTDe58B0aeNA5lQksf0e6Jys9d3wCox/4SD
	n7VmD8eN/WQeOL/s1KAX2Ps=
X-Google-Smtp-Source: AGHT+IHkcZjDQOAwHADh9ySrv8AZOUsLca6FBP2ogTSfxx5J3OTGLHGjNdk3BTo9WKhHMCRKl3QJyQ==
X-Received: by 2002:a17:90b:3b52:b0:286:ad3e:dea6 with SMTP id ot18-20020a17090b3b5200b00286ad3edea6mr1119615pjb.25.1701878122939;
        Wed, 06 Dec 2023 07:55:22 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id sj16-20020a17090b2d9000b0028652f98978sm3451pjb.8.2023.12.06.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:55:22 -0800 (PST)
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
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Harma board
Date: Wed,  6 Dec 2023 23:53:14 +0800
Message-Id: <20231206155316.4181813-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206155316.4181813-1-peteryin.openbmc@gmail.com>
References: <20231206155316.4181813-1-peteryin.openbmc@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

