Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F165B0CA7
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 20:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNB4C3Jjnz3bc5
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Sep 2022 04:44:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qT2rv/W6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qT2rv/W6;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNB440kYMz2xrX
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Sep 2022 04:44:02 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id f4so11168814qkl.7
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Sep 2022 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Tfh1jYz2seicx6AV08/ib0aISutfnAtuDr/ZNE4dv/E=;
        b=qT2rv/W6yKqPgI56xw+ZJHPwcn3c0j+94Vr6SrPpFUYToCtCRwuhrJ7kNjZ43Xwk6d
         jBKomZqOYH5bUcozHEQqaH/Rcu21meIdr7vuAIOWyYcdeEunP2JD5ueXl2KewHUzevc0
         L/LO4NlITzyyMDohYnELXmBGWh9ennnEIMY0dwMRXfDguimE2mGH0OEsuwHy96/Tisi8
         uBpDO28UzMvZ9cU85H7o6F3R9HnIdetlwWJdefPTvXusTpUuRDEnQ57zOZtO6ttaLXqM
         wjAS5CrhJ4io6rxSPwwxVujpZcUWNz1VuncGETTAdXDZT48QPEkgOjKotrw3KoQtk9zp
         ZIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Tfh1jYz2seicx6AV08/ib0aISutfnAtuDr/ZNE4dv/E=;
        b=kNjtHv5oD0fg9U7k2Aya5JNb4wczj9ezXnA4pENYB5Zbrd8AJc7WqKN1+hP1mDhrah
         /kfWBQmjs+bF3Gtohtps2KF9Feaz+Al0BBjOpW1mr78Sml+JRuQU3LsHi3RX0hLOG4B9
         XRwTXnlvd08T3eOG/qLuvEzd6YUd3MGSmjBx8j1WNpr1KaC+zkDVvzUgQItHfu8WdZrv
         pc/F89LhUZgEK8cJxabr+7CNRjyKfLV4kBdN943LjBsS9E77qdXBfntZZ9qm11ZBE7AK
         YNv5k7SIC7sOChdxBnJg7B1wpPUMWy2wP26b9xlNfM4v9kDVXUe4khaagWYYSpy9QkZm
         DYNw==
X-Gm-Message-State: ACgBeo05gDE9Vck/yRTWUDARzSNELXMtaFVp4gB+93uKVHuzNSKZURiY
	rm0tIgTulBXHilT+HiKaAaI=
X-Google-Smtp-Source: AA6agR5MMZEf+8dXTu6lY6P7Biw9MBxUWBD38CtWHxjt+Ah9nBTdaes6u1rSzcuHHYDNcYe2P4NO0A==
X-Received: by 2002:a37:2d05:0:b0:6be:8620:57f with SMTP id t5-20020a372d05000000b006be8620057fmr3578436qkh.688.1662576237270;
        Wed, 07 Sep 2022 11:43:57 -0700 (PDT)
Received: from [192.168.1.102] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id w15-20020a05620a424f00b006bbdcb3fff7sm15694869qko.69.2022.09.07.11.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 11:43:56 -0700 (PDT)
Message-ID: <666c3928-9495-1ee1-4e6e-f3ae1863cdd6@gmail.com>
Date: Wed, 7 Sep 2022 11:43:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH net-next v3 1/2] net: ftgmac100: support fixed link
Content-Language: en-US
To: rentao.bupt@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Heyi Guo <guoheyi@linux.alibaba.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>,
 Guangbin Huang <huangguangbin2@huawei.com>, Liang He <windhl@126.com>,
 Hao Chen <chenhao288@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220907054453.20016-1-rentao.bupt@gmail.com>
 <20220907054453.20016-2-rentao.bupt@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220907054453.20016-2-rentao.bupt@gmail.com>
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



On 9/6/2022 10:44 PM, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Support fixed link in ftgmac100 driver. Fixed link is used on several
> Meta OpenBMC platforms, such as Elbert (AST2620) and Wedge400 (AST2520).
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
