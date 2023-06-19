Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E8734CF9
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jun 2023 10:03:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R5lm2JEo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql2MH2xhlz30PS
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jun 2023 18:03:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R5lm2JEo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql2M83n9dz303l
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 18:03:15 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98746d7f35dso376499666b.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687161788; x=1689753788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MsnoYz0hP2V8CBehrpeQPUT+76r/6pTB7F31k/oTqQ=;
        b=R5lm2JEoN1Dap5ewRuzod70/svJW4Tpp+Jf/ugmj1Yk7OL5KSTGTc2+KLFvXEYZtts
         ByDbXZoZ7c6jDHRXmdIpI2Ml/CJ5/87e+a/DcPAG4qe/3X/dS3mR/WK4HcxKs5G54pUp
         k3US0FIJ7DwVVZDtHqibOsRlTx7HuZTzO5NocTyCsvoO0L2t+Nb4MTpHWCpzfkFAzYLW
         W8fprdmu60ugR/QdbVDPQtR5R20Jvp9cCsX76SdJ2g4o9MfkcRTPivLh64I9A68Mq1Uc
         VXKXFrmYX1ZqL+v+ALMzoK3FotlHqeR19D35Fi1kZwhwCLSy8CvBHZMSKbipZsiKSQif
         KoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161788; x=1689753788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MsnoYz0hP2V8CBehrpeQPUT+76r/6pTB7F31k/oTqQ=;
        b=OdJ0/+kMOw49UxqAVQXOhEjOTJGJ8GZ+Iboy7EMa5WGyY0l3x2fYeYMw8PLw7BLmok
         XLqPBe8W5ZGHBzmo7i8JLrJySvN/6oG/ochf1FCjZMJ8ytDD7b0kYUh/vJR6FZhBNtl5
         S7RAo7UkjO+0FBWrJtsR/r1+VS8Q5wnj10Ocbu4RFfKGVmUu1nKNhJn8xdge4uEolsQd
         MAi3fm2oSBnUz+iF4k5cn6iJsV1+C2UjliHGrUlFT8PXPEfivCb80bpBFymsv1mjbqjw
         l2NtsoE4FztWMmZ6ZGmTO3U/ueKrCtlOu/JGOqnYAmA7CqI7Hz1OWZLaaMCLapR46HfL
         84Rg==
X-Gm-Message-State: AC+VfDxfa2Mnav0VS9kuIG2UVn2/ejJujt44CNPtPqWSMxxD9o7oYoXv
	r1xC43RP1UxVAUl1u0lEVxBQHQ==
X-Google-Smtp-Source: ACHHUZ4G6sKfA1qmngTmVTdImZtQIJooHKrYQsNUpw4ekWRnZ6ieoPMK8rs9BRGC1ccyE688NqDM8Q==
X-Received: by 2002:a17:907:31c2:b0:974:c32c:b484 with SMTP id xf2-20020a17090731c200b00974c32cb484mr9045597ejb.72.1687161788200;
        Mon, 19 Jun 2023 01:03:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906360200b0096a27dbb5b2sm14113007ejb.209.2023.06.19.01.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:03:07 -0700 (PDT)
Message-ID: <68262eba-c9b7-5c3c-acb1-1c651931e959@linaro.org>
Date: Mon, 19 Jun 2023 10:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Content-Language: en-US
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20230619064249.3623-1-chen.pj@inventec.com>
 <2a9e503b-7a5b-3b1e-a912-5d54a23c1ca1@linaro.org>
 <832a9af9c9024ed3b7bee0d36a482837@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <832a9af9c9024ed3b7bee0d36a482837@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>, =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 19/06/2023 09:47, Chen.PJ 陳柏任 TAO wrote:
> Hi Krzysztof,
> 
> Sorry for brothering you and thanks for your patience.
> 
> I use "git imap send" and can only send two patch separately.
> After your instruction, we setup the smtp server and now send two patch together.
> 
> But it seems still not enough.
> Did you mean we need to combine two patch that modify the document and dts in "one" patch?

No, I meant the second part of my message. The long one, explaining in
details what you should do.

Best regards,
Krzysztof

