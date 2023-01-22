Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E3677050
	for <lists+linux-aspeed@lfdr.de>; Sun, 22 Jan 2023 16:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0Hf737Zkz3cBj
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 02:46:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMCG5kN6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMCG5kN6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMCG5kN6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMCG5kN6;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0Hdz4F1Zz3bVD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Jan 2023 02:46:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674402384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E6jYgjX2bdUMfo7qC2knF1fy2KORUnKc0O3IR4qBP1I=;
	b=jMCG5kN6Hk0sUrcvMFON+vnAKbAM6JNrtdD38/fK0ZehtFoGhKmFLnlKGpp40092AUPHcg
	8j6nc573X+jqwqS7zsseMaJ4FHI//lF8m4on7FHFNyRI+cO9EWSoIJffiCmbdbD0IrxuJU
	wv4NW52yj2HkaHBYHo5+x+cSM/+kbgA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674402384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E6jYgjX2bdUMfo7qC2knF1fy2KORUnKc0O3IR4qBP1I=;
	b=jMCG5kN6Hk0sUrcvMFON+vnAKbAM6JNrtdD38/fK0ZehtFoGhKmFLnlKGpp40092AUPHcg
	8j6nc573X+jqwqS7zsseMaJ4FHI//lF8m4on7FHFNyRI+cO9EWSoIJffiCmbdbD0IrxuJU
	wv4NW52yj2HkaHBYHo5+x+cSM/+kbgA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-jAtZ6q7BNkWp9p9fBEnouw-1; Sun, 22 Jan 2023 10:46:22 -0500
X-MC-Unique: jAtZ6q7BNkWp9p9fBEnouw-1
Received: by mail-qv1-f71.google.com with SMTP id r1-20020ad44041000000b00536474f245aso2857929qvp.16
        for <linux-aspeed@lists.ozlabs.org>; Sun, 22 Jan 2023 07:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6jYgjX2bdUMfo7qC2knF1fy2KORUnKc0O3IR4qBP1I=;
        b=q7cxIVP7pXPD2JDjmnvmPE4vT6Xf/xMj6MfpL67PW4LzMgRosxxXSwRB0iYSN9c+Xx
         WN4tNHb1j5CbjQJK0WRsFJoM4r/+FCZZ+FUdudh8JCViYs7UuHF5nZquegtl+Ow7WqdM
         jw0J9/WTbz5bX/mpcgc8VrSSbn3n0ihmC3vmIPZgJBGQe57RM0iY9v4YiwAmgMwDMsSV
         hzt2M2r5fdhwue/8LfrZ5WtIA4OPckv9LtIvhvuQe6nLq4KQ3Qrk7HDV3vvrpUMZ5MsJ
         CnPt+0saeUasSjZcZgDIHoC+S07F7zALRSQ1pmS4JW2BxsLUNMiGBVJmvEn2kp9wQ72u
         B+ng==
X-Gm-Message-State: AFqh2krAJmkhw/T3GwxerMikCuOZmtJqvRA7p/TZovXIYLgwxC9uo0rq
	iki0KshwLKP3X+tp4bnOOWWOP2lrkv8iXKZMzbc4CQ10CUmU05zJW8M5ODv7ZtnVTsWeHoUhKLq
	u61cfAnNKig9WFS3jOwKRSNoVPw==
X-Received: by 2002:a05:6214:350e:b0:535:b22:d8dd with SMTP id nk14-20020a056214350e00b005350b22d8ddmr31727131qvb.5.1674402382087;
        Sun, 22 Jan 2023 07:46:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzKqhaSc8ThZothYAnzF5/kTMB4L4BWs63as8xoBUPLzodub1dl0JsOxTCxYNPbqC2WLN7Cg==
X-Received: by 2002:a05:6214:350e:b0:535:b22:d8dd with SMTP id nk14-20020a056214350e00b005350b22d8ddmr31727112qvb.5.1674402381836;
        Sun, 22 Jan 2023 07:46:21 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h8-20020a05620a284800b006fa7b5ea2d1sm29929090qkp.125.2023.01.22.07.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:46:21 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: neal_liu@aspeedtech.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH] crypto: change aspeed_acry_akcipher_algs storage-class-specifier to static
Date: Sun, 22 Jan 2023 07:46:11 -0800
Message-Id: <20230122154611.504808-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Tom Rix <trix@redhat.com>, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

smatch reports
drivers/crypto/aspeed/aspeed-acry.c:606:24: warning: symbol 'aspeed_acry_akcipher_algs'
  was not declared. Should it be static?

aspeed_acry_akcipher_algs is only used in aspeed-acry.c,
so it should be static.

Fixes: 2f1cf4e50c95 ("crypto: aspeed - Add ACRY RSA driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/crypto/aspeed/aspeed-acry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 6d3790583f8b..164c524015f0 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -603,7 +603,7 @@ static void aspeed_acry_rsa_exit_tfm(struct crypto_akcipher *tfm)
 	crypto_free_akcipher(ctx->fallback_tfm);
 }
 
-struct aspeed_acry_alg aspeed_acry_akcipher_algs[] = {
+static struct aspeed_acry_alg aspeed_acry_akcipher_algs[] = {
 	{
 		.akcipher = {
 			.encrypt = aspeed_acry_rsa_enc,
-- 
2.26.3

