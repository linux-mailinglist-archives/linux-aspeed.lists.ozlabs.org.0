Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDD9554536
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfVW3yjGz3ds5
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:18:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DnncSgJU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DnncSgJU;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfTR4cL7z3f2l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:17:47 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id eo8so23250668edb.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ySkJSlQo1QiWIR9DLd5CIrfBGUCsep0GFFfnEfKFKN4=;
        b=DnncSgJUOg++r/Npn4SZZ7gvSY+IV6yT74oWsTQmNIjVH+IpnLK7l0TlMlvlCDYZS1
         2tv6WK2RBy8Uprinq17piL0bsFWAsjrj5mpuLCyThG6jMiSZtIlFXzbWySzAn5b01SdU
         ebRY5CGjXu+p0ATuOK1noCYTrMi0aCKYOa3e51d/CZwhjJj+FL3LpfcI4g+hmevOWQU6
         RMFFOee9Nm21FAmDpCnOn88A99ZdocWvmS3yUMOEajmt0l9JE7QYUHd64CoXp6DB7MZV
         1XmfvmuDFO1JO5tUqwVASyzzgw/2NjMDdH///0c2D5eEUBkZmj5O2z5GTgxEJ208UUII
         vlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ySkJSlQo1QiWIR9DLd5CIrfBGUCsep0GFFfnEfKFKN4=;
        b=fzAAP10FxzkZSZ5Qzkjt732aD2wnESR6InLhmCnDbf1y5nhjehdeLaSTy7I3YTUNe7
         BwiTxxXkez6bLdB0/TAjJ9iUroHocDYstxXdQwDXusgVqGJsq78pdeRtCN/6c1+rvixh
         5nHIEcW7reNM4MRU/pZ9MYYFRoCRteAPGG4D4K4TANYEMHKQ3dygVWNIgP43e4LwuKbz
         2socUbSKgA63kOhADtOAkqclIVNtSvpu4j54dZO62tcIbwGKF9y+tugRvsdYLxNPk/Yh
         rnVRCMw5PEOi1ugvzrkllwVk3TK585UDADfEucoh1JFZUXFCGoubjSeYozNj3H28gd39
         d+Mg==
X-Gm-Message-State: AJIora+cdeK0GgCXYx0rviQvwfGSEHfzFVrN50+4U+g0gZHoIsxGmTP0
	B2V2YlcEGwaoJYIBEP1+ovhesQ==
X-Google-Smtp-Source: AGRyM1tVe9qPZdAXW/Yf6kb//4YtLCp5bqCUQK/D3F9haBOVm/B3p84N9+vNGIkS6zSOIQoSdRmmwA==
X-Received: by 2002:a50:fe15:0:b0:435:9155:f83b with SMTP id f21-20020a50fe15000000b004359155f83bmr3199554edt.391.1655893064356;
        Wed, 22 Jun 2022 03:17:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ky4-20020a170907778400b006fe921fcb2dsm9028707ejc.49.2022.06.22.03.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:17:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: steven_lee@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	andrew@aj.id.au,
	joel@jms.id.au,
	krzysztof.kozlowski@linaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chen.kenyy@inventec.com,
	linux-aspeed@lists.ozlabs.org,
	robh+dt@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 6/7] ARM: dts: ast2600-evb-a1: fix board compatible
Date: Wed, 22 Jun 2022 12:17:38 +0200
Message-Id: <165589305701.29629.16741118174396025883.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-6-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org> <20220529104928.79636-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David_Wang6097@jabil.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 29 May 2022 12:49:27 +0200, Krzysztof Kozlowski wrote:
> The AST2600 EVB A1 board should have dedicated compatible.
> 
> 

Applied, thanks!

[6/7] ARM: dts: ast2600-evb-a1: fix board compatible
      https://git.kernel.org/krzk/linux/c/33c39140cc298e0d4e36083cb9a665a837773a60

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
