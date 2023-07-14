Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1B753068
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 06:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d8qAos+3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2J3Q2pFSz3c3W
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 14:12:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d8qAos+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2J3H6pqGz2xr6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 14:12:25 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3143798f542so1584772f8f.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jul 2023 21:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689307938; x=1691899938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8CTz13Ju/w9ax8ItZAVN5IBS20v8dpfE5mavSr6QmY=;
        b=d8qAos+3KnkGz93yO8WWHVCCKmxnxkGJKeWhWxHc2Xf0lWJ+2zUVBs2HZFPYhq/2Pm
         4zPX3OgolxCGO1rMqd6s88CbhTvUOVLtmkJOQEsFPl7k0lGsxYnVaXJvROUB0NDjbo3l
         2/o94arb7IgUTDblGtpvp94s9BD8UFCD9+ak0hrLyz3PzaQ2mvVaEk7jJeNC7Yjsqs4d
         GxfZ2oZhhx3TUj2HxkSv0bxAAJySlFXwP5Qa9rJ/Xd/4NtTwoIp6z3ekzp1TMkM8qa6b
         zzrC7qElNpYTiy9Oe6fJVxL+2uEOUqefUOWv/DXabeqQP3kJnrAlKD/B4fI/vz1h8U96
         njYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689307938; x=1691899938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8CTz13Ju/w9ax8ItZAVN5IBS20v8dpfE5mavSr6QmY=;
        b=BgLvDxbFa8QKQ/oK7HlO827T9YLHGapKDm3eL3kN+zNo+jsnrDEzCxBFFV0DlyPdM9
         WIQQLyddn6D4Y8VyKFFuiXhZWqiQoaHW2cfJm72uOqOuDrIkTVEN44kePGJAgNyzJj9Q
         ft0W9Gg6qHrp5nvEuD/8LEiUO/b81XwLRVpxy+rkeEtK6tKd6Y+anLq9xJWiWAoZvJYI
         gKMqfzR1Eqy2UGRjXRCqaas5ccEuVgAm+5Q3dCBOumBzA5y11F24TXdb6s13rrr6h3zG
         3/gziV82Jmbumg2PccxjhqIwl64XpniCJbrXUK1y5rGT+Nj31iKnvNyjiKpNuLXb/qUw
         BN+A==
X-Gm-Message-State: ABy/qLZp88aY108rlFTXGwPNFGpamE9yePfbmzhHF4+FYKufCyZ0pbt7
	s/ZfE96mMMpCpq4T5dywksi1tA==
X-Google-Smtp-Source: APBJJlEiIEZ5oNA1kHIlijl6CR0KNtgyfSCPe+BnecIDGB/eed9crKM0HAEf5FXJE7lQ0/sQpDohiw==
X-Received: by 2002:a5d:68c6:0:b0:313:f235:cd17 with SMTP id p6-20020a5d68c6000000b00313f235cd17mr3038668wrw.40.1689307938125;
        Thu, 13 Jul 2023 21:12:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r12-20020a0560001b8c00b003141b9ddab3sm9566447wru.114.2023.07.13.21.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 21:12:17 -0700 (PDT)
Message-ID: <627bcf48-d9fb-5bfc-f45b-f9cf614d081d@linaro.org>
Date: Fri, 14 Jul 2023 06:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] Add Facebook Yosemite V4 (AST2600) BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz
References: <20230712073752.54624-3-Delphine_CC_Chiu@wiwynn.com>
 <20230714023502.3225096-1-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714023502.3225096-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 14/07/2023 04:34, Delphine CC Chiu wrote:
> v2 - Add Facebook Yosemite V4 (AST2600) BMC
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

Best regards,
Krzysztof

