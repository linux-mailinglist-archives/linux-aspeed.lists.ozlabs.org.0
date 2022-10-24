Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3960B68E
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Oct 2022 21:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx4J22GNGz2xl2
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 06:04:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dPUXKTYi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dPUXKTYi;
	dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx4Gz3RY6z3bvs
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 06:03:37 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13b103a3e5dso12967674fac.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H8i7U5bmMKO/8z/xC4NChgsxdHTmYMHq2WLzQcOksu4=;
        b=dPUXKTYiNvpyV/oK0w2Z+840q4ciXuOPb6P66JQaakBUBvfyiKOKMDYbwOnXTXvtpZ
         HOXhU2W+agoxJFZKi2WQVJ3CuifdKHR23nAqJIZED113Ptuyu99YmqW9I8EiDfbH8EXd
         Jh7chDuECzTosoXNty9NH+TgR5xZc+p/29KWrTan1T4K6jD7MqSHBzqm2v720ZM7psR+
         u7ViduNkkOCWpurn4v+bDMsa2ruLusIvicSSEEWJls1ncitrb1pwEKzi7UNU9GIMT/DZ
         bsDpB9BG/6Yl9ZTArhW4zC2inHSVwDYzWdaoLLLxtZeD4fFAZbC/iKgow8cpeKN3zvKN
         HhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8i7U5bmMKO/8z/xC4NChgsxdHTmYMHq2WLzQcOksu4=;
        b=nPXYsBmYVbLnYLvbIT7zc17R5RJM2OO/ysxJSI6SRLUeWGGxcp3ls7wh7AHFdV4e0Z
         qHm5+385Wb/RRLj7cgp3J/nCKj050qXyQ4sfC7TmKh4UkkzrcMs9UaN/6v1wmvQx4G5N
         QNLvAghdG0ILSjXptQWcdmHHEfcuyrfiQ5w6QYIJE1DqWARZ2MUgeO+2DJkkGQVs2jID
         7zBmxdutws+APk38Lk3f+dmGSNNT4Ky/ouPsLJHlVl0jawY2xRNjApZm+TSc4GflpKCy
         u1CxeOBfODpoqqYSSRizCuPbU2VeXRQJVTSzS4uBpuD4VHiT59S0EsC4l/asnTA6nOt4
         lE8Q==
X-Gm-Message-State: ACrzQf0SOTYdI7O+uTfmrPAkFWgwYHhMtb+FlOzKB6JZtcD4kphKodd5
	zhu+C5T8huZ/WOov7+6oVZs=
X-Google-Smtp-Source: AMsMyM4H5JWmW1ivLCPgGqI7B1uo7DYgBup/VLoraFetEljQEQzdMgP4Jefq4ToKDnv4e6dYgXOLPA==
X-Received: by 2002:a05:6870:4250:b0:13b:686b:af0d with SMTP id v16-20020a056870425000b0013b686baf0dmr6984899oac.34.1666638210138;
        Mon, 24 Oct 2022 12:03:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d22-20020a4ad356000000b004805e9e9f3dsm331882oos.1.2022.10.24.12.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 12:03:29 -0700 (PDT)
Message-ID: <31046e78-840f-4c1a-3966-6cb539e11685@roeck-us.net>
Date: Mon, 24 Oct 2022 12:03:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: aspeed: Document
 aspeed,pre-timeout-irq-us
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Eddie James <eajames@linux.ibm.com>
References: <20221021151559.781983-1-eajames@linux.ibm.com>
 <20221021151559.781983-3-eajames@linux.ibm.com>
 <20221024184423.GA2023764-robh@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221024184423.GA2023764-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/24/22 11:44, Rob Herring wrote:
> On Fri, Oct 21, 2022 at 10:15:59AM -0500, Eddie James wrote:
>> Document this new property for the pre-timeout interrupt.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> index a8197632d6d2..81d2c35ca7e3 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> @@ -40,12 +40,17 @@ Optional properties:
>>   			specified no external signal is sent.
>>    - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
>>   
>> -Optional properties for AST2500-compatible watchdogs:
>> +Optional properties for AST2500 and AST2600 compatible watchdogs:
>>    - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
>>   			 drive type to push-pull. The default is open-drain.
>>    - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
>>   			   is configured as push-pull, then set the pulse
>>   			   polarity to active-high. The default is active-low.
>> + - aspeed,pre-timeout-irq-us: If aspeed,pre-timeout-irq-us is non-zero, the
>> +			      pre-timeout interrupt will be enabled for the
>> +			      watchdog. The interrupt will fire the specified
>> +			      number of microseconds before the watchdog expires
>> +			      and trigger a kernel panic.
> 
> A pre-timeout interrupt is fairly common. Come up with a common property
> please. You'll need to be clear if the time is from wdog restart or time
> before final timeout.
> 

It would be nice if it would match the semantics of the existing
pretimeout attribute in the watchdog core.

Guenter

