Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE4566A0D
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jul 2022 13:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcgly2yDpz3bwX
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jul 2022 21:43:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=shqlCX3e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=shqlCX3e;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcglt6v9lz2yRK
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Jul 2022 21:43:04 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id l7so13410889ljj.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Jul 2022 04:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=IKFzC2WnGUeD5q+RVNdKS9eslmn2mdX7LBfEuxyO6s0=;
        b=shqlCX3emJgRu1Pna1MbtQuzhWuZhEs8PAA3jmb+7RwgySeFo2pGBXoPkUWUROHBBE
         FWZbGO4cg3CylTU9GMQKslQU32a7dGi3+ijWcXfay2OlHKiQLs0ykj2NaBe5N/JhzfcN
         19xo3isaGrJzv1Q6jLa3uCX3qtqId5yQXZkG1gBtCYGF9m1D6W3K+PvTsvtnG5Opat8v
         o/P62oNI8QylZ5Yj9Mg4YLSpYBwicg168DhTBaEd/0wSpdFVgRCtBlwvqtwmYWdcyAny
         cvAgYT0jpvypq33fbyiza+NiaR+g6NRINmr2/Nr/4ON2zNx8q/MXLtSKOCtFe4MVAc5m
         LPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=IKFzC2WnGUeD5q+RVNdKS9eslmn2mdX7LBfEuxyO6s0=;
        b=Fq686Nwh21ZP32mnEESP1S/7fZI+BaNEYgr3bKgx4c5KusOYsnDdYh6FDh46ol5UvS
         5r6QHD9Z1f09IRrmeXkHyPjwjIHLvjXbE0HJyHpbBC3vJVRrhvksBMMA6/n14lxzD0Z/
         EPfjpAVxvo9Ihirbm85tdzuFN0xq8oWveAjMzakfrLymA35jJR9Hq6PgdD9Ofc4aP8Za
         120HyPgsl6rzt395jZLmELRbN8JIhGb7qhOYjKMvmdGP/jltmUJFADxRq2DyKd2uPTnX
         JU6yp1NUL/+7/YqX3JaYvAYq1Bsa94Oc7eOoO0bjyoIYCbefka71LYHt24A9kDbcZeet
         PaiA==
X-Gm-Message-State: AJIora9yj0WOauU4bJPgW9miWR9snnPZdLmhGJVXwSuck9InaZSttjmT
	hI0P8tk2QiySn98jxo/l0OwH1g==
X-Google-Smtp-Source: AGRyM1ux3EckAJGDpDmodjM6QA+G+YsFdxnyaku2jwEufpmBJihqJQ038PHElZsdEF7+/vgSvGrxFw==
X-Received: by 2002:a05:651c:1a12:b0:25b:f6ec:c71 with SMTP id by18-20020a05651c1a1200b0025bf6ec0c71mr16262193ljb.253.1657021375670;
        Tue, 05 Jul 2022 04:42:55 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id w8-20020a056512098800b0047255d21124sm5673760lft.83.2022.07.05.04.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:42:55 -0700 (PDT)
Message-ID: <3a01a031-356e-fde2-b160-0676fb542f51@linaro.org>
Date: Tue, 5 Jul 2022 13:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 36/40] ARM: dts: aspeed: align gpio-key node names with
 dtschema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
 <5e0d5cca-c4a8-6651-0e67-47b5fc23c5c7@linaro.org>
In-Reply-To: <5e0d5cca-c4a8-6651-0e67-47b5fc23c5c7@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, soc@kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/06/2022 10:49, Krzysztof Kozlowski wrote:
> On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
>> The node names should be generic and DT schema expects certain pattern
>> (e.g. with key/button/switch).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 30 ++++++------
>>  .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 48 +++++++++----------
>>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  8 ++--
>>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 12 ++---
>>  .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 22 ++++-----
>>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   | 23 ++++-----
>>  arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts   | 20 ++++----
>>  arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts   |  2 +-
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  2 +-
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  2 +-
>>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    | 30 ++++++------
>>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   | 12 ++---
>>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   |  4 +-
>>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 16 +++----
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  4 +-
>>  15 files changed, 118 insertions(+), 117 deletions(-)
>>
> 
> Joel,
> 
> Any comments on the Aspeed patches? Do you intend to take them or shall
> I handle them with the rest?

These are still not in next and still not response here, so I'll pick
them up.

Best regards,
Krzysztof
