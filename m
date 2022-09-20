Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74845BDFF5
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 10:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWvmc0LQHz3bXg
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 18:27:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dQ/DjRpy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dQ/DjRpy;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWvmW4b29z2xgN
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 18:27:21 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id k10so2545243lfm.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rkPuKjWB8t4FYJYHNtyFAmh2TFPD2Tl5mYJFMngelcQ=;
        b=dQ/DjRpyzJOPnWU9+cHPp5K1+NyJCZhOur3fr22c9+x8TZvCIw3Wcm0Ssp0uyu0tu3
         yDDjrQf/390dPv2OjCBN9ar+Yslw5Vh0fVAQX8AlXvaY25n5382qD7bJM1e0241bf31K
         t/RWa92e+NIVi73NA2XJEQ9gC5SHHY6OG3PNjNkBoaEQRWlqWeS2vfA0PLbAB5wMazJB
         fHSWi3l/1HDzrc2oNVcqu+Sm13Pe3GWuxmuoytOGa0ws99C836uILRrzbUixZuOvSv/r
         ls+HmEav2ZSNabJ8ZLCTc+r9snw3TKsTKsXXK3TDBlrt0paJ/WLA95C0Sj8dn6pC7OFx
         a2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rkPuKjWB8t4FYJYHNtyFAmh2TFPD2Tl5mYJFMngelcQ=;
        b=jBpWUmNXZae7rVJblsfRhZT2rpi111IVFLBha2BSTJNLRHWJpuk7UeTj+fBMY4feAC
         VymMg96ah7oakamL5stpEOF2hMgKfFxowSxPuOlsDhcr8r69aNJEJP6TTiSptCcIsYF+
         u73DlN/OGO+IHANzo6GA8XQn7hQnTOuH+zrs3uiuGK+t7ouVkJg15G7SrJ9KySlR/RBH
         FzQa6TtVSu4GNsBc0+R2gbZvacbVrdrBQ9p6RU2nt5eTgcHcCAmMIilu0tYydwwfTqE0
         iGINxdU98DPNiVh0a1krTV2p6ak9eos4du9YiJMqVk+xjXoV0MZ6paUZ3HSKQJltvNYf
         20sg==
X-Gm-Message-State: ACrzQf0VppTnajAHg4vhn1yBjU3+9DYfmQe94qAeQr4VBuUttpW+mWYI
	0qCshP4eQ511UHFKbzXyNtmDUw==
X-Google-Smtp-Source: AMsMyM4BFghKOOucFsHQ4S+QvuMdbzcePIG13Xz2ThhzLq10ft0xMOyHNHZhr6ZzPzppj24LyC566A==
X-Received: by 2002:a05:6512:261e:b0:49e:e7dd:8912 with SMTP id bt30-20020a056512261e00b0049ee7dd8912mr7259070lfb.360.1663662436750;
        Tue, 20 Sep 2022 01:27:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n22-20020a05651203f600b004978e51b691sm190279lfq.266.2022.09.20.01.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:27:15 -0700 (PDT)
Message-ID: <9d702646-3517-be57-dbdd-c5e5d803dd4a@linaro.org>
Date: Tue, 20 Sep 2022 10:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes
 (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
References: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
 <1b03d24e-7bd3-f912-b59b-f2199770e9d8@linaro.org>
 <HK0PR04MB3105362597B1E8CBF897D0E3F84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR04MB3105362597B1E8CBF897D0E3F84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, "garnermic@fb.com" <garnermic@fb.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/09/2022 09:28, Bonnie Lo/WYHQ/Wiwynn wrote:
> Hi Krzysztof,
> 
> I am sorry.
> I have revise the DTS according to your comment and revise the subject.

You send again the same patch. If you intended to send a version 2,
please indicate it. Git format-patch can help you. Our process also
explains it.

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst

> I would like to update the patch to you, so I use "git send email" again.
> It seems like it doesn't reply the original mail but resubmit the patch.
> Could you guide me how I can reply the original mail thread and update the patch but resubmit it.

Resubmit same patch is not correct. You just did it. I expect new
versions of your patch. Each new version should be appropriately marked
with version number and changelog. Just take a look at other patches in
the list.

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst

> 
> Thanks,
> Bonnie

Do not top post.


> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

I notify you that I am going to remove the email immediately.

Best regards,
Krzysztof
