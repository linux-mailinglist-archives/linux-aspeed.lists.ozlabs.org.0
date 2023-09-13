Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8E79E488
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 12:05:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OyWSwdwc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlx0Q6VPnz3bfK
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 20:05:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OyWSwdwc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlx0K2ZPjz2ytp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 20:05:21 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso8759102a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694599517; x=1695204317; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFmG4mhdY6EhuhcP3xdyYDj0/6QzZEcQDMK3fE4AcJ4=;
        b=OyWSwdwcq+Ezw6swcHvUdv8XnGQKWVK5MLoLAigeQi5sfFPeo54Dk0EsHeWqx1tU1W
         VSu/YdtgFoY+LWeyoG+6LkREbq+WwrVFW1gJh4N2hDSUAQHqkRR7r3eKi3oBX+fi1l32
         TBdaZrdmvpU7lT/M8IaumzhQ4RBXt/AbdYZZfd09ujOY3MQOGixE9ACTqxJ2QVyh01Kh
         lC5+mFCibZpyUcZ4YoOctg+uw1V/9fJuPrAvvqKUXpngjZr1eSIs2WVNqZYaxs/TaSvS
         EL9ZSMBZ1FITpJfJ/Dc8E9BNJgGpmm16i3wyvccq5zeNQFAwO7lpubeMDrOzlBAZKTWZ
         MlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599517; x=1695204317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFmG4mhdY6EhuhcP3xdyYDj0/6QzZEcQDMK3fE4AcJ4=;
        b=Aw0wc15fO/o3XZv2tDeFzNZ2T53x9WEb2rxu28lBjSRn4ve2Phoc5QsKkJjf9KfIA2
         dzZBWzvyW+5j7il/fnUaLoXK6Uv5Avks4lGXNsBMUfG9ApNxhBWEYW9xfjRDhzLWFZKY
         vyoUMCrbVFS5cUmfcjy3tA0bx7bVbR6C5ewupLlbPuldDqIEUx+HhGuI0UYnmI9E6pfQ
         rR0/NWcBZoXjs4Na/Y+0eun2lE3tL8/02lqpcXwSCuAdM3NpQHk+gKdLmSZAs8rzbFuK
         KepBK7w2III0DIoKzP+eXZqkhmWy8PyUKhxcloSRzB7/FV74ZzCRQa+PJmgwz3RJXdOK
         zkfw==
X-Gm-Message-State: AOJu0YyOgZTnoXGhuXAhS3uu7Q+QmSzQgu2aG6y+5Zwe8SKbTADUYdd2
	VukgJDQfAoJrikY5lZiF5BEACQ==
X-Google-Smtp-Source: AGHT+IHaD1pVlw1qOeqEr5SFsK0Z5m2lvLnOxGDIVREaxORKV6nuNZ1rUMAJCAGbtvY455PPl89jCA==
X-Received: by 2002:a17:907:7604:b0:9ad:9225:cee1 with SMTP id jx4-20020a170907760400b009ad9225cee1mr1520153ejc.62.1694599517002;
        Wed, 13 Sep 2023 03:05:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id lw7-20020a170906bcc700b009a168ab6ee2sm8075192ejb.164.2023.09.13.03.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:05:16 -0700 (PDT)
Message-ID: <605e4577-1e01-cd0b-9d42-34401bd7f3a7@linaro.org>
Date: Wed, 13 Sep 2023 12:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document board compatibles
Content-Language: en-US
To: Yang Chen <yangchen.openbmc@gmail.com>
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-2-yangchen.openbmc@gmail.com>
 <26a53f62-d8d0-9583-e675-a3db99c60c8a@linaro.org>
 <CALFa7M_Gov4jd3wxrXWhxuPKbDr+cp8xmuWJCQH_N=a+q03M1A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALFa7M_Gov4jd3wxrXWhxuPKbDr+cp8xmuWJCQH_N=a+q03M1A@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/09/2023 11:52, Yang Chen wrote:
> Hi Krzysztof,
> 
> Thanks for your reply, Minerva is a project of Facebook server that
> includes two types of boards. One is the motherboard that includes a BMC
> and another is the Chassis Management Board that includes a CMC and both
> use the Aspeed SoC (AST2600). These patches are for the CMC and the link
> you provided is for the BMC and they need to use different DTS.

Are they similar? Maybe you should share board DTSI?

Best regards,
Krzysztof

