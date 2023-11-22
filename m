Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261007F3C5D
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 04:25:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cw6hyn9I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZmp20ZmTz3ckq
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 14:24:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cw6hyn9I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmnn2Q8Rz3c82
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 14:24:45 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b83d207831so236019b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Nov 2023 19:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700623481; x=1701228281; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06y6U8sIEAJcocDpDQt1xUv0207pV5nMk8x8doEVyR8=;
        b=cw6hyn9IThMrQhOPPqra6ITcPtvfzFKLNkoUjyoG95slLl91ervyoZWHmbVV+OLEMb
         BoNHS8WrmXNytNYawxTySgSCdSvWDWwK2HO2t9SRb9KD1KJc/Aj/ODU5SwUBNFenI+Q9
         S/jmbkBqofhvHIUBsqvBYZnJfQlbVDnhRwa4NQikMphDEt9nK5lT4O15xbawuWDkLnKh
         o2gtbCnNetEGv8A+MTVGzOUcunphzpCrxKrwzhI/W4IsVvanjkCabOs17QZKIoMDb5Jt
         OkF3MSbAL4oBDwgjZrgxcjVqSHuUOWppRFMqqyaAKOjbBrFtJyH6csmJRnT8WrYxkk2M
         PvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700623481; x=1701228281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06y6U8sIEAJcocDpDQt1xUv0207pV5nMk8x8doEVyR8=;
        b=UNHA+b36wq2BRW/XiyWwOSTkl8H62420zbdROwQXDKOJDQSqdaN23GUIQy6RP4HCRR
         QYImuDuFhJPFLcTruffelHF5E5XMqo6wMwDxvWfCXNfZq4Ilk1pq0NEQ67YESvPhS2Wh
         0yAvRk8i8mhFCtND12kLETlr4l74Tgxp9FGq9vJRQAKoWxc0flgg2ePRYQirUYHaUaBi
         I5K1YyIpvx6MEqcChf7lISwUxuXRkQZ2Z2MFIlwCQqrViUK08kP6D695jL48kseamWUf
         0z5HPe8zoyahP6Fl8ndUjxzNfpGprSBj5iZDAs+kIfQnNK68GxP7nchBs88UOXgcsCAU
         2AXw==
X-Gm-Message-State: AOJu0YxWFiwaUlX/HhSx9iuHQWd2QKclyi9GcSTIapl6j2WVZv+oGpLU
	S3xmr11xrnBhAXBIHaOy5Y8B7KMKNHc=
X-Google-Smtp-Source: AGHT+IGp/lLNXGHKX5vtHx2LciGvau3yOT75/yckm6oIhuiZfYpoWlBqMAyCqhqsBS2wHrsv7r3Q5A==
X-Received: by 2002:a05:6808:23c9:b0:3ae:501e:a64a with SMTP id bq9-20020a05680823c900b003ae501ea64amr1774710oib.10.1700623481117;
        Tue, 21 Nov 2023 19:24:41 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id s4-20020a056a00194400b0069323619f69sm8820110pfk.143.2023.11.21.19.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:24:40 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Minerva Harma board
Date: Wed, 22 Nov 2023 11:22:33 +0800
Message-Id: <20231122032234.744144-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122032234.744144-1-peteryin.openbmc@gmail.com>
References: <20231122032234.744144-1-peteryin.openbmc@gmail.com>
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

