Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3E5F7492
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Oct 2022 09:08:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkKCX3QsNz3bjy
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Oct 2022 18:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ubXUXF2r;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ubXUXF2r;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkKCQ50Clz303D
	for <linux-aspeed@lists.ozlabs.org>; Fri,  7 Oct 2022 18:08:18 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id q17so4667355lji.11
        for <linux-aspeed@lists.ozlabs.org>; Fri, 07 Oct 2022 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QAWREG0fZCyP7sEbxrdyuueNgOkgMOANl7rSPu92CYE=;
        b=ubXUXF2rT8QIV0grzSF/ZjJ0uk/W8GCGxRhGV6JJrXSdroCqYCMrBWE5eeB2wixQQb
         bNHvDnMJASdWrBUoWTHwM3TkUQl6sbz7ur03/CaQNf2mnQSzG3f7mEtUqUdUzX459+mn
         lTyqDUrwjR0W1OGkLOQd6c0b5sKS17YBRpdEMzTN+y6jESmYePl4b/dTGFWXZdx/nBRr
         YTBmr2IlaNzr5dlh8DlCGwHTBc6bEOV7+gQnhDypdHLvpr5FtWxAIj9VVm6sPeBEgkce
         gkBu2SJcxKIvqByEXp9AbzG2s4gjxQkLBKCseX4YGLzUgH2ZJPfOU9nSbtqtOIDZqrfo
         QKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QAWREG0fZCyP7sEbxrdyuueNgOkgMOANl7rSPu92CYE=;
        b=by9kPh7HrwJK6yoiufg7cagTdGBCZjNHO2CATxe5cEtoMbpwymlXCYo2cNRAyespbF
         1B3NV1w0xspPv3gWeBi9nfqsq9Ixmn/vmfC5iVrshGViX5OsxEhmS8evmWXJNx/TLhv+
         8TCd1wJGUvNtpTqBMuA+S4nbrvCfKLU2dD1HBefFoTdepdDUsGFuwyqn1cqeSsDp/ctE
         CczyChXrs2gzjnUWFZwETFIa55iDigoNVf/QWYCDC0TR24A8Syo6H5ycUBFc9QwDpz64
         6SeKfEGtt0YxeCVphq+zQpnHK0ANtF39A/sHqcVfZFKsJDdvC8T6bQXe6HRQ0LAYBAP4
         CeZg==
X-Gm-Message-State: ACrzQf3ZYEKipPLFnrs+CSLTvtCJOllS1PEaCOXpj2ShDm5RgrpFSb9n
	L0fBvEhNYbiKgnvWZaB+kMu8vw==
X-Google-Smtp-Source: AMsMyM473sQQs/vKSRlyYkR3OApB4KcWSwOQhveiGiuOUL87IXLjYECurmB4ceu2K/zwRweooeT0DQ==
X-Received: by 2002:a2e:bd84:0:b0:261:e43c:bac3 with SMTP id o4-20020a2ebd84000000b00261e43cbac3mr1216270ljq.198.1665126494341;
        Fri, 07 Oct 2022 00:08:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b004a27bb1ad62sm174124lfb.205.2022.10.07.00.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 00:08:13 -0700 (PDT)
Message-ID: <398470cd-7f2c-28eb-fc13-54ae5d5bc256@linaro.org>
Date: Fri, 7 Oct 2022 09:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 krzysztof.kozlowski@linaro.or
References: <20221007055008.3468691-1-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007055008.3468691-1-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Bonnie Lo <Bonnie_Lo@Wiwynn.com>, garnermic@fb.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/10/2022 07:50, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Greatlakes
> 
> ---
> --- v2 - Add binding document
> ---
> --- v1 - Initial draft

????

That's not how patches are sent... About this I commented and you ignored.

This patch was a part of a patchset, so don't send it separately.

The subject is now corrupted - entirely wrong.

Best regards,
Krzysztof

