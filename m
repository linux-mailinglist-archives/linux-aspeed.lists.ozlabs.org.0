Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F2693FE3
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 09:45:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFdFX0QCtz3bWq
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 19:45:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ce9PhkrM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ce9PhkrM;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdFQ5HN8z3bWq
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 19:44:58 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id m10so2371151wrn.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 00:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVhmnyzlvjU6w08QExRu/9m1+Smxo1ZuK+3+ewxQH6w=;
        b=ce9PhkrM8KBdrxGPKkF//JQ72Jf3C86E9bAfdsACY7vkJPlsRQ7U5FLlsbvloeyoDs
         nJdUN7Fwq8SkViocpgckP3Qi00lfpMF1EB+EbRHs4XecO9AqYXfFTIBN5Poex9cLWq9N
         YeQqkri0L9RDT4kXruqMYP/3LByQcYhIx/f8cLzEmCdCeimDovmkdWr5CnWu5tWvFMPH
         4VRItkQhIjgImPfC0P5BlVi2qbXz3JzQe3UwmGW3WXoAA3VhaeBaLm3Ajb0eUGeYfPI6
         5iCw9T1/W/A+6oCvvUmARMyb6/bFisL9czYsHdrxEe2lJKQNX/3vtgbK8OvkdIhXwknK
         YeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVhmnyzlvjU6w08QExRu/9m1+Smxo1ZuK+3+ewxQH6w=;
        b=JmGiqfOFTQuH/piNwpKoTQQGXexEh/22GRXPIHyE3saPVdms+HXDh24Q78Y2n97eN9
         OPGu46fhjLalhV9txSwI0cN4eqx11fVj1RqbGZTONB8YPJlbLeifji6snO5l+Y4RAt2L
         d9DMt50BUY9Dj6zKTYHYnbitzBJqy/DCkEaTAAj56rhS50WOo9MZ7ynOSWJCr9zpgOGM
         Ql47hGdQHnJ+Fx+IO17PFi/Nm54R/ElvGidoOSL4/MEhSkXbbRiHSdZxbzcIy1V1HZ9O
         tht3bIUUtfwYvWQUgW5BW7SXN1tF4SQx1ZzNjMDza9JpTEImIYANZH+OJ31cx+8ciswc
         bHnw==
X-Gm-Message-State: AO0yUKUjp8KS4UEACHcgBpyEu2F9vBeesv+M1hr+poycNCU8iRc5vCyA
	oQn5NPQiFVLaQcMFhndsbxepUQ==
X-Google-Smtp-Source: AK7set9Bf8sZZnVH9yHy5eoKdsD65/9rHk/Bl88GUtYBCSU8RhhUWNl+dZb0GhT13B9JLrxh69Xo1Q==
X-Received: by 2002:adf:fcd2:0:b0:2c5:48cd:2f04 with SMTP id f18-20020adffcd2000000b002c548cd2f04mr8157187wrs.6.1676277895424;
        Mon, 13 Feb 2023 00:44:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b002bdda9856b5sm10079519wrc.50.2023.02.13.00.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:44:55 -0800 (PST)
Message-ID: <d0919faa-63ef-0957-afb4-543a05864fc9@linaro.org>
Date: Mon, 13 Feb 2023 09:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] clk: aspeed: Add full configs for i3c clocks
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676267865.git.jk@codeconstruct.com.au>
 <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/02/2023 07:02, Jeremy Kerr wrote:
> The current ast2600 i3c clock definitions are top-level (rather than
> based on their actual hw sources: either HCLK or APLL), and include a
> couple of definitions for (non-existent) i3c6 and i3c7.

Why do you use subject prefix in patch 1 different than in patch 2?

Best regards,
Krzysztof

