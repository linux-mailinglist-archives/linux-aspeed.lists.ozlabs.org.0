Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD68566A16
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jul 2022 13:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcgq825Kjz3bwr
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jul 2022 21:45:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=URNJuoOp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=URNJuoOp;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcgq2026mz3blh
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Jul 2022 21:45:49 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id m18so1625770lfg.10
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Jul 2022 04:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r/4T324lD8keVZQ5PYxI+TWmPc+ll7mlIbj/tyFipEg=;
        b=URNJuoOpk11cwvlncuWTNnZWX81XgDdSq2sk4ggVSqyshGUOyttDiBZMAMrUZ53cdS
         UxEdb5yao8x82Cg67KkBx3UBW2EOZZwnfULw31Cb5x1mfD0LiE8DszQYOLDpI0djx6gx
         qGb+FfCvIeu17sB4bz3twfxNlnsuI0jkWr24PA38Lmyyb3Y2lszeV+ZVOekbRZRYxOYA
         /g5VVucsOKKGkttArP7gS0ROtvWAtTC3UghlCgsVbvNB8BXEaihcyZ6KEHR6dZa0OhmX
         w3uCjaYyUcDT71MZbTYAxiDn4Jux2e1iVVgp+ZOl35ENoD8WBqUOZPoj64XKEL5apYgs
         zy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/4T324lD8keVZQ5PYxI+TWmPc+ll7mlIbj/tyFipEg=;
        b=wVzt7Bbh07zOiw4luSTGHAP5HTqq8iT6/+AEPj6DOfp3ZKNWTD9IhlM4K73LVUktaF
         VtZr/aRas4aj66HpG6E40CTphO+/YAvNAXklU8hD2mXnHpQYwVLbJ1222KQiVsRv2pTb
         pAd2ksE1O7BDvHfsYB0ykwJGKjwop11SHfDVb5KLB0yhZSXFn5NCRo0xJHysEYFn5pzs
         BuThwBW+eHdEDh1vbF8gxXyIsrZUw0kGJn/fZY5tq0dtpxOMQSjXsyOUh9DOVTUb55VS
         NB5qO/jBYUNgnXZKobDgci6k193zWbqEvb1rPTlxiqjh4lJKTiWzWNbZ1ExMk9VFsCqF
         PwgQ==
X-Gm-Message-State: AJIora98euP8IyDGvjzHs8plUBUSt1S3XuKh66hR0h/6WXdLI6q1PWwc
	5AxCrV/5fcAsh+gXl02ZxsZy8w==
X-Google-Smtp-Source: AGRyM1t2xrKflh6+ZDUqgZrUw23+6BNtmn1uXO9uRraUJ8CvQFIBVL3fJqJJsi41XYxhjs43M9wogw==
X-Received: by 2002:ac2:4c56:0:b0:481:16b8:637c with SMTP id o22-20020ac24c56000000b0048116b8637cmr22631447lfk.87.1657021545341;
        Tue, 05 Jul 2022 04:45:45 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a12-20020a056512374c00b0048137a6486bsm3543694lfs.228.2022.07.05.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:45:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: olof@lixom.net,
	krzysztof.kozlowski@linaro.org,
	arm@kernel.org,
	andrew@aj.id.au,
	soc@kernel.org,
	joel@jms.id.au,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 36/40] ARM: dts: aspeed: align gpio-key node names with dtschema
Date: Tue,  5 Jul 2022 13:45:42 +0200
Message-Id: <165702154046.92998.7201310803196878513.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 17:53:29 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[36/40] ARM: dts: aspeed: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/7bd809eee4290ae7277f4fb20f270fcedd74737b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
