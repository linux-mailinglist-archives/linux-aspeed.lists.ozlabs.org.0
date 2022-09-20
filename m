Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1B5BDDC8
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 09:07:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWszn4Ywxz3bSS
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 17:07:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HPT/6Gjg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HPT/6Gjg;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWszj3s98z3010
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 17:06:56 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id i26so2203799lfp.11
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 00:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BpGibXFgS0C/8+QW13M1OlsPel1EQHzKXdhl+DKxo08=;
        b=HPT/6Gjgl4SGIytwzUcr3sYP2ohP3kgKY6hkpB3irXCTIxpy/JZERpkhxabAiTD6PM
         JPoD0D24wIcG83ptsDEsJrx79haAbkb+ktr/KxcNEFhDBqlNoKetTEEtK6mNpnfg5cWi
         zTRMF9FeN+iOx7g1zheSFkh6CtR43QtgJvAzb1iKgswKJL2VNE9GODHQ4bUM/fAxV2co
         Wq0xuhIegzSTISXDNoadzzEgeib8bnQG3F/qiJDFUcswKZv1Naqu/oe7V9AcFscUywHL
         XYYTHDipmu7HeoZhRWf99LSdm1FjrO4rOq/anaDb9z9us9v/Lqlne2diVY2I+MPzAz5v
         uqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BpGibXFgS0C/8+QW13M1OlsPel1EQHzKXdhl+DKxo08=;
        b=d6MlhGhg5zPqL/1XqlN1qndXqkq0QVMl5fs1F0te9WqPKkVsPkta7sQeEKtB7s7kNq
         jLgznDtvJNgfwSCvRokcZ+ZZ+ecCiTK49G1tWrTmMhL6op9JJrI6us7JfP6E53zGkwh5
         /UJPqvRKtw7goyvjLRN/V35VwQPrAWOZjMdglgTLahSEzM8In6xWF8aTSsUn8nSKNdlL
         GnhVGvzzE5PcBVLR4OM8AcRlchXIBi0EJx4ijPJUgtHPRve1vnSF5W6pZFp0oZp1r5Uw
         DSAu8mic16cMbxClcnya5bjl1/z8IZSZGRbRYdFc3V/V/BPX8eYdvEdbC+n1cw570ZZE
         6Wdw==
X-Gm-Message-State: ACrzQf17KLg41M5B6S51Hd0Tywf6z/SGROczusht2n7+QvxczR/pSvyX
	XGZz+6HDquOHgJ1icEWlrPQHlw==
X-Google-Smtp-Source: AMsMyM5ppkFWKFY0q7coi2ylM45dStSfuK7WNLNglTVeYJNwKlA0P10H0k8wQBoC6MA5O/rI6AMKvg==
X-Received: by 2002:a05:6512:400d:b0:499:d9e:e04c with SMTP id br13-20020a056512400d00b004990d9ee04cmr7127207lfb.400.1663657607344;
        Tue, 20 Sep 2022 00:06:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v11-20020a2e9f4b000000b00261eb75fa5dsm113836ljk.41.2022.09.20.00.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 00:06:46 -0700 (PDT)
Message-ID: <1b03d24e-7bd3-f912-b59b-f2199770e9d8@linaro.org>
Date: Tue, 20 Sep 2022 09:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes
 (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
References: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, Delphine_Chiu@Wiwynn.com, patrick@stwcx.xyz, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/09/2022 04:30, Bonnie Lo wrote:
> From: Bonnie Lo <Bonnie_Lo@wiwynn.com>
> 
> Add linux device tree entry related to
> greatlakes specific devices connected to BMC SoC.
> 
> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>

Do not ignore comments, but either implement them or keep discussion
going. If something is not clear, feel free to ask for clarifications.

Since there are no changes and you resubmit the same patch - NAK.

(...)

> 
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

This means we have to remove the email because I was not authorized to
copy/distribute it.

Best regards,
Krzysztof
