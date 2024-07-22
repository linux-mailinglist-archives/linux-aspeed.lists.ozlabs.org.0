Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F772939133
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Jul 2024 17:01:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QUPNb/Re;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSNlT2FR8z3cWd
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 01:01:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QUPNb/Re;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSNlJ3tbtz2y8f
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 01:01:15 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7163489149eso3393124a12.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Jul 2024 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721660474; x=1722265274; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEwnmZngztpGdhQKMQK8DcDKmkmbdjPxn0+u2l4YgUM=;
        b=QUPNb/Re9+fPwE1POqqux4bRalaNv74txGdW6QvoLEMn5uL+ACeYOSeMjkA3jHBY1y
         AT+DjZAeNFQA7kgCnC3bICO7y0b7DZ6mC2MrpO2Vsrwuykibeuug4iITg/uNELNMGwSa
         iyC8Sbg0etzMiefJ+GOLSOAIVukX94ZDXBmXh74/lZHDcoDNIPsT0fWAj5Yxo7ZdDVrf
         aO9UuTwI5NQWnsBGw2sJrRTPXzWbMBDjl7Ie9bN681AqSvLvSt7KKEL4qn+mlLHnwJPM
         jQGDh0ZxlRBCsZpRY9rH5NRKy1zY646lFm6hvLlixt+3bXB8vcBd9gIs9oXaCZHsDzlM
         qoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721660474; x=1722265274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEwnmZngztpGdhQKMQK8DcDKmkmbdjPxn0+u2l4YgUM=;
        b=ZQ9sLzcMVO4xIB9Gvldk41056Rij7XWfWueCaSvWdCtQwpcm97T1HmaqUE0dGwXp8x
         DsunLo+2LYU+oue1P29KJUTUHlRDezOxIyGvUEKLz9nw15uJGpeSL5FnxvL6w96ttZkS
         FV4v+piNR6b1bNZimGRFWfdrRIs83uvLbfuFzhU4366bmhKue9UXarvsGNd88alZvuOb
         8XQEgrFbIg7yMtME9Sc0OmVUWsinTbTSnoUKnvI4AQxVN/naXU6KhW3j1qR2t4e6HPdB
         aewd90M1Rmj5SlEJeY/3gksClvV5fKIpuGhdOQKA6RVwA2DoDkpLDoFlLxE7iqgvw3p2
         J9gA==
X-Forwarded-Encrypted: i=1; AJvYcCVg6x1I2U4KUYKVdsh1cNnxXZXXTxPCWpxJsTVwZiKu4o8YyMKCx9XvqI7NVfqrVnOFjUrHc7WdS60PfPt/gwh9/zxIAnOaEbLfecl5sg==
X-Gm-Message-State: AOJu0YzkT5xyj9/CtvWPrq6tmT9G7OkVTMsCFSWAgasv4lu0C4pxzj8r
	B+oSeQ+UwSBuXt5NGB4lrVA501XLvSUa7F2tgE2SzSEgGplvpl6U
X-Google-Smtp-Source: AGHT+IEPSq62sELNfy1D4JuXZzDLEZiEmFw2jiPgiDdDhamzHk6c978zwSKVuzN/cUiMq24B5S66Og==
X-Received: by 2002:a17:90b:1012:b0:2c9:7fba:d895 with SMTP id 98e67ed59e1d1-2cd274e0263mr5394357a91.38.1721660473545;
        Mon, 22 Jul 2024 08:01:13 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb77304a15sm8224207a91.19.2024.07.22.08.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 08:01:13 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
Date: Mon, 22 Jul 2024 22:58:56 +0800
Message-Id: <20240722145857.2131100-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240722145857.2131100-1-potin.lai.pt@gmail.com>
References: <20240722145857.2131100-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Catalina.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e386d0ebfb14a..2f92b8ab08fa2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
+              - facebook,catalina-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.31.1

