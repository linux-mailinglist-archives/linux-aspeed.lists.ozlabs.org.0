Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB178E724
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 09:23:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=O4pS0gf3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbt1D6b5fz3bTt
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 17:23:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=O4pS0gf3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbt162HVSz30dt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 17:23:06 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26b47df332eso364912a91.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693466583; x=1694071383; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=O4pS0gf32ht3ySIhW8Ch355FgivZzsvTmVKvMVIp2IbRSMKZ5Gnymux0Z0Ldd1Y1T8
         N0/uqCJWpsEdDfQ+b2yMNGJjjcO7/OlGK/QLrwhXsfai0+/RXZ4UYVBlvMw0mIMELGob
         MNDY8Ff6GJG6hmboHtktdI1fmYM+5rG0Dp2NI6ugwutjZu4yxCbdby40tVNNcbE1xK21
         XdVAypmPqbZiN8ThLQVDrb2mDKPXtE6RZw6VZyop4oJiZDlHsOCdnoeIeip3qtkf4exA
         vmnhREsMK+Z3weKgPp8LMEs3XLCXEZHabL5R4vT4kp1j1Wwdde7ojdg41+AVhlXbeT6N
         T7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693466583; x=1694071383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=X6m3EsNRWf5qo0+PSq2caG4XwKWmmAieWnWQnfm52Za3jdzwWK1Ex20sfeGpBmuPkl
         lEH3K4ZslxO+PHNtVi/vfNsNyMU6DVx0XaSziPjtbp0GDpXOa2CAPO0fOCgde6zDahZL
         FqIRErfUC8/vjP094MI/l6BpeJLWO/cLUVGBj1jrn4tzQarRn+nD34ly6BFLf3CsMMBj
         yc/Y+Tm/onjhRSRMdMY5cItxjKqaqljc8/OYddyoYfuLpacjazJt6tHduWK3QeFW6B53
         d9bE3QTdKtFIDPxVghUr5HV+ntS+loPeeyxlFYJcwRK7LmRHvsivvGcDlAGVBvy+1+ff
         dLhA==
X-Gm-Message-State: AOJu0YyoYKe9P7zCuKq13r37DB/Qr8W7v7lrBXBQ9gu76vUjmTS5jCFN
	SK7MuQG7YC6XUgEJIpyJWF4=
X-Google-Smtp-Source: AGHT+IG8RaRmunMe/+M8syUr0us8nmdh+ZK2SxJG9HILQx5j1VfNjThFTYg9e6Gzivnci5tefbRqCg==
X-Received: by 2002:a17:90a:a897:b0:26d:43f9:11dd with SMTP id h23-20020a17090aa89700b0026d43f911ddmr4134463pjq.0.1693466583475;
        Thu, 31 Aug 2023 00:23:03 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id z11-20020a170903018b00b001bf8779e051sm628794plg.289.2023.08.31.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 00:23:03 -0700 (PDT)
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
Subject: [PATCH v6 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu, 31 Aug 2023 15:20:47 +0800
Message-Id: <20230831072048.3966398-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831072048.3966398-1-peteryin.openbmc@gmail.com>
References: <20230831072048.3966398-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
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

