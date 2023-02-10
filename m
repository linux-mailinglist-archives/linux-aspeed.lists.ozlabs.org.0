Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E0691BFD
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 10:54:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCpwm1w7Pz3cfh
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 20:54:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=StafhWd9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=StafhWd9;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCpwc1684z3cdk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 20:54:05 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id o18so4476160wrj.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 01:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT/YTaczEsqUTwtjEMUlyfX5CYHzpcISFyERcOWxQMk=;
        b=StafhWd9wRSyN57pB6OeyIV1oXxde2bom8ccd2vsCgV8Q03LXmkn7/f4XF6AmbWxHV
         p3CASxzY0nhkjAqxx5X8YBS23Tn9xwdtzKRFRlOnU6og/PMyd1QQi/9vzArUJqIlyNxW
         EGL1KqLtNNuuFw7TGAJawmQdS8QnfbWPvnUT7Qyfx0tABPOsn/rNwXzWyG5KS4mAXb8Q
         5UjUqffm5+ra6GjCADD2OB1wDu87xCcrCjipvzNNlgsf6tv3T9EN416nCIqsQgEzdVV+
         ueJB2J1YmXpBhdJ8tqEXQW0ubVscFdFwrtn+g7jUJXII7R6KWBxDTEQxTCxRqGhOSg9k
         ePlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DT/YTaczEsqUTwtjEMUlyfX5CYHzpcISFyERcOWxQMk=;
        b=Bp84q8Ok/kzSPiJq4AhdgTOTiI0NeriFF56q0XPtUx3wgIPtIQexjm+F70h6gG6zk/
         643SJqxSCRTzOnECC+MDPFBnKpWMsTMFYUEuCbVEyPDWf7Ifk7rZNFtFC/IRz4eIFX0l
         h2mwLGqtgePVlKt8N0ELstmyKuVj0+ImB2QHSP7d6TxhLgOm+ny86CiXglLX2IuscIIw
         D/LShG1pD9DNoH4O5ujxI3q0kqyoiK23PcG4Fp9DYx4eVW0/BKxv+KlY8RmFwjym072b
         ExkCov41YSAfpjx7EBQPzJI7qqvrKZheJKc8Z3/Z+6xmI5PSBOKzbfz4DusKW4yzDe5Q
         JzhQ==
X-Gm-Message-State: AO0yUKWb0T5yhRnkoAXAgJd63mqegoh7vzk6FvULOqpPnqT0N7AbpHMm
	v3P2ck/5X22V1g4slgODzH+kwQ==
X-Google-Smtp-Source: AK7set/mQrAtmfuIVos3kekrVUbU1HQtOa2i/MpfcvN3fFMdpIOrhpCy8l3PlJuS/m6POCcQgb1QQw==
X-Received: by 2002:adf:f708:0:b0:2c5:3cd6:4fdf with SMTP id r8-20020adff708000000b002c53cd64fdfmr4413510wrp.39.1676022841466;
        Fri, 10 Feb 2023 01:54:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d4207000000b002c3ce97ec38sm3311518wrq.115.2023.02.10.01.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 01:54:01 -0800 (PST)
Message-ID: <c400735a-901c-5fb3-428c-81258ff99615@linaro.org>
Date: Fri, 10 Feb 2023 10:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] ARM: dts: aspeed: Add device tree for Ufispace
 NCPLite BMC
Content-Language: en-US
To: Jordan Chang <jordan.chang@ufispace.com>
References: <20230210055451.72153-1-jordan.chang@ufispace.com>
 <20230210055451.72153-4-jordan.chang@ufispace.com>
 <4b735136-d9c0-cf01-e453-c8da31754a93@linaro.org>
 <CAJ3czeSeuPx1L-qkXFVLR+UQDyJHF_G4Z5MdoYSeLaifWNnn=A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJ3czeSeuPx1L-qkXFVLR+UQDyJHF_G4Z5MdoYSeLaifWNnn=A@mail.gmail.com>
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
Cc: jay.tc.lin@ufispace.com, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, eason.ys.huang@ufispace.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/02/2023 10:21, Jordan Chang wrote:
> Hi Krzysztof,
> 
> On Fri, Feb 10, 2023 at 4:56 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> From where did you get my Ack? I don't recall it.
>>
> 
> I misunderstood the usage of acked-by, please ignore this email patch.
> Apology for the mistakes.
> Should I resend an email patch or it still works on the previous v2 email?


Please send v4 with correct tags (so tags present only for the patches I
gave them explicitly).

Best regards,
Krzysztof

