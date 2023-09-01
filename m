Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B234878F771
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Sep 2023 05:23:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hOQN+9/h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcNdc4Cr0z3bxZ
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Sep 2023 13:23:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hOQN+9/h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcNdX00QLz2yVT
	for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Sep 2023 13:22:54 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68a6f6a66e1so1263253b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693538572; x=1694143372; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBLPQzPIWAWSC+qsvJbFVdMdGKth1jrainH5lRp8kgI=;
        b=hOQN+9/hZA1w7tli2ywWbQtvv6HcOwNTw6LQBso0R0ShQUBJ8J1m85BmD/6sl/5NYl
         3G6BS6US+FDxvxPArn/7Uvx49VSPfdqyQndfdoYzp4blxtkFiEWD+V+mqEN2vNq/QCPF
         F7fZsG7a2U5FnoEsnK1TQ+1vCgyGzZ3Ym8Ww0IwzoOqJ172drlQr7nWW+BiOkbX+0TqU
         kvieK9bdoc0TRf61xdVFypB8JCH+lNbdiwEGUWqp2IX+KX3W4gnUWdQAr2WrevYlL257
         V7bzjjiYv7hY6IFKnZ2GbgLcuGzwtsfFUeMPIedQi0/bzCq1hE7JrK5Qlnwy2AdfnSep
         Vibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693538572; x=1694143372;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBLPQzPIWAWSC+qsvJbFVdMdGKth1jrainH5lRp8kgI=;
        b=bDvGAvDAL7OYGUnG/xJZAIAsIsF+CeFSL8Hqe2U3kXkCtgNg+z7+CmmA7CJ5uwpbUO
         eUx2RcsQ+YMFWLnad9rWAW6GwFcACu4m8zBbcf801PnaQp4l6UdqH5qG2OKht+8q8iZb
         nsc65vPqc384obU0hYa6jy4JKLQIf57rx3G350JBxrcwHUo2PDlp+wjaN8JgMhNKMMQu
         hnKFaoR8U5V34+5kWEpHmkCTj/rh0yqYH9t+YysYeFHk2lz78PCvmLFe8LvBsPLF/mNs
         NGbS0WxrVdmZDP2r73u3iFMvQU83vAyfECnYS+Kf/lFtAhvI+AY/obHcgL7Fz0135jV3
         KBkA==
X-Gm-Message-State: AOJu0Yxu9uUrwmEo/lCatBUY1wM6wybxbGp0w0PSMZEedvFD+Wl3OfST
	8JLkZPVBP/tRuNLsZM0b41c=
X-Google-Smtp-Source: AGHT+IF5ywUa7Qg+xJbjyDPhgXCzWKPknLqcwuD2RE4g0BKWwqAHqS2Q0t52zJrFjKRYQwdObFdUrw==
X-Received: by 2002:a05:6a20:6710:b0:14d:5580:8ff0 with SMTP id q16-20020a056a20671000b0014d55808ff0mr1193033pzh.25.1693538572050;
        Thu, 31 Aug 2023 20:22:52 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902fe8200b001bdf45eb5b6sm1908358plm.284.2023.08.31.20.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 20:22:51 -0700 (PDT)
Message-ID: <ffe1aff7-5216-ce3c-d57a-1163731d1158@gmail.com>
Date: Fri, 1 Sep 2023 11:20:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
 <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
 <7b241edd-4775-afbc-e5a1-63f5ecfce331@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <7b241edd-4775-afbc-e5a1-63f5ecfce331@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 8/31/23 20:38, Krzysztof Kozlowski wrote:
> On 31/08/2023 10:28, Peter Yin wrote:
>> Document the new compatibles used on Meta Minerva.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.

Thank you for kindly providing me with the information. It has been helpful.


> Best regards,
> Krzysztof
>
