Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A678E607
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 07:54:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k8c46nMv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbr375ZZzz30fk
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 15:54:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k8c46nMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbr310bw4z30fk
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 15:54:36 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68bec3a9bdbso282588b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 22:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693461274; x=1694066074; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=k8c46nMvizox2TwuzrkomD+KbgmGKBYznqLrAPyNHOUbcoJnvx4BPZmiiH9uPxM5oD
         IB2XciVDMdcIoILCtU2S3sDC7JKluTJxI1qar/ZsLvq3fMcFWPlXec/OjztOryDHrpfp
         IA9bePdJu18xS5f32N9wcr9B46/01l0oH8sK6hXXrM2NTLdCAmWSBMbe/eDSzW3xFiZg
         7AHd5pJzWiTvWhi8VJV4zEq/zNWqhZX5iHKa0tdOvZ3sHoFnC/diXpOzBNnRPPv361WF
         7ZVc2uaGuCY9QoGNmjXour3WxldUpIwClnaS8GQPbq3CukmOee4XW5ZAOuVQpUeWfaOe
         tADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693461274; x=1694066074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=PqUKFh+FMJ6sqCmrhP/cpCM0Pl4LU/PwVovS+9M2chTdPQYWW4mCp3fDWCOFaxXXpw
         mXznRU5Asa+knLS6n2yT/N3ERpTxAYZPOCa4qjUPMkeGgYJBRkVUFdw0QBlI/UmOdFaU
         iaYzEtq5px372+jhd13kRH6Nwu55LXoIbrX2geOKWO5jfLofKtuVDFTKUzDgIrmEfZBt
         EA2rlFREnhotaPx6AQYJnTP7ZBq2zREntZrk9wlzSJrv5kprn5oZDW1D1XsG3QmmJSnW
         fs4VqWbi6WgCQNFKMkVbod8HgmAUrNDdgfAmEPB7Pb+0W8KEJE578AhZuwTF+cNJLHp6
         5Ptw==
X-Gm-Message-State: AOJu0YzzXNjC0tsFzC1I0gkvpTADjwP2RGnFLF5UhGSbCg0wOoOzfY66
	bprsg7paMn1iEnO19mousi0=
X-Google-Smtp-Source: AGHT+IFUGw1M1uBQkEgMOfIGdbWWIHSByC6slXUncszykg8B6jLlpF0bDlkZIpaxT4SYXakGVB8QaQ==
X-Received: by 2002:a05:6a00:218d:b0:68b:daa9:7bf2 with SMTP id h13-20020a056a00218d00b0068bdaa97bf2mr4727872pfi.7.1693461274468;
        Wed, 30 Aug 2023 22:54:34 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b0068c97a4eb0fsm506731pfn.210.2023.08.30.22.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 22:54:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu, 31 Aug 2023 13:50:29 +0800
Message-Id: <20230831055030.3958798-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Minerva.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 6b0a6683ccae..3b93bae4f43a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

