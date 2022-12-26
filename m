Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF3F656038
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Dec 2022 06:48:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NgRdt57CKz3bYL
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Dec 2022 16:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Un99RLgo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Un99RLgo;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRdh2lCNz3bT7
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Dec 2022 16:47:52 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so6821240pjg.5
        for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Dec 2022 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87f0TKfgjxiemevwHpQhVGmMoe8NuCN8KvjmmGoJcKg=;
        b=Un99RLgoUgD6VwGxVDiAWbe0ZBFbzdTF/PS3A/DVSjbwc9FYLekIr+QFeg923zh4Re
         4mGJeCzpmHxuBho1xhQx6gjiOPVp9yWqOmj+K0ehgoufuCuRejM3yC5Hol9GNkenjeFk
         0aWbXrX3/q51C6PMpQ7ZS1laJZZeH0At2w1hdsYBz7jh4Ty7sF7Y7jdywEaAyIUYtzVc
         3dDJy46pRBwtaAVku9ulK6uli8QhpKEDw2saJVmvCc302hIoXpFZFvnPvy9IeNd2yU/t
         UgqwMj6jd0BCoZf5saDtgq9/A/g22o+NjTYSKxQW33sAZrCYN65L+YUfEsayWrWZgjZt
         G9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87f0TKfgjxiemevwHpQhVGmMoe8NuCN8KvjmmGoJcKg=;
        b=6msHDvB3NBjIzWQ2oN1caY56FInfGqF2rr6cBVN5XcUtoiia5VxCuiNa3szkRZTPi1
         G3kJstOd5pOf9Ko725yLTae8gal57SuZWiT68IuDPY3b5uUBtPdyH9igSCvVm5u/f5KW
         iKt/qbG8Gxq2A6pvXzcqw4VLYIJIaXWUwWoIZbHLFwGr5/CW7v17wDZBIEvrH4ahP6fD
         PM6e/aD2iX5ptciFDbrPcGj6Nt3AZmx4f/o/XljPXLaEfLm6/hEAaVaTLIAu35tjKmsZ
         TrsdWpo6J1mJRBp74eRE+yiKkDFIZuL/lr1DjkaPbmOfHj11oIMpZxIRYFYuNCYqGw+u
         MjDg==
X-Gm-Message-State: AFqh2kresKyJc85QGjeWPsnNT8rPutEnDAle9nS+/JDNwaBhcwJr3Bot
	Ijcjf67ZxV2B4Nf3Gsw4etY=
X-Google-Smtp-Source: AMrXdXvJ52ah+JhJWrYHL09E1VzFUCxLqP8oKoLx9D+Iyg46GZa5OCS49wuCUy4jevmOlvMgK1tqig==
X-Received: by 2002:a05:6a20:2d1e:b0:af:6f24:b154 with SMTP id g30-20020a056a202d1e00b000af6f24b154mr23355221pzl.60.1672033670203;
        Sun, 25 Dec 2022 21:47:50 -0800 (PST)
Received: from localhost.localdomain (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id h35-20020a632123000000b004785d99321asm5618242pgh.86.2022.12.25.21.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:47:50 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] ARM: dts: aspeed: bletchley: rename flash1 label
Date: Mon, 26 Dec 2022 13:45:34 +0800
Message-Id: <20221226054535.2836110-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
References: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In OpenBMC, phosphor-software-manager use "alt-bmc" for secondary falsh
label.
Rename flash1 label to "alt-bmc" to support dual image feature inOpenBMC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index a619eec70633..791f83aaac50 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -307,7 +307,7 @@ flash@0 {
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
-		label = "flash1";
+		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.31.1

