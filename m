Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAEF97BF54
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 18:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X84Tq1GNlz3cPK
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 02:53:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726678395;
	cv=none; b=gAVb2V6s94tN9OxLFXO/8kD2efbs/XIlFuiuCymwxukFGUwW4c7CV3HmNm/qJwvyS5N4IdxNUiUfdp7wb6LlgkVrnAqSU9XHX3Ne9StmzV5C6idmZQcjlFYCVuSSVHNi2t0dEwoxUYOdvDm3RliEpAjYb50T4IlDDXYy3v5dwvJQcQqUefCzmrUAJFaTTjKoMVR7h2GVyIL4J/6uUoIg1su1vGmTy4pOqBGEGJhWVDLB8/j0hAdWzJNw77jlyzX8xwq+HLN0vAWq8TioZS8Y2Ujiih/ZVgTM/GG3nssSUiBgDm0dXewuYGcCk8hO3KKCLkJo5RYUC1kl1QEG4OQjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726678395; c=relaxed/relaxed;
	bh=TwVG27iWjhMbbo2rXogcr5hiQ868jFDOAxTn8sf+ht8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHnVvpjLeTlzCD1xi/l9mO5aOTc/oPSiinERxKDApXrUwDbRWmTkgCd1OR/RNidQC8EbhNeAGf0hiwhqITfjHZIguO15UW4gcqOxjSxwYj8pjFQnVoV0YHapWLrNJYYlNOkMRl1b0Oy0zoS8HsfsfZG60hlOKLC2O2TpRxR5qdTkw8Pxel4JdQBlwS5S+e49+MaPYB/yMy45EY4jiJWpnndSkBm1LNorNY55c59xSpxJOR4tU371Gk6oEDa+DhX1hbMmMzQuUsgVuKXNHsjngg6FTI5jAJqxMN09q6Q8cJ+bWwWLQdzftO5FIViS0LgE6N5LGVZI962N+IIJDLyi6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CSd/T809; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CSd/T809;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X84Tk6pXjz2xG5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 02:53:14 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2d87176316eso815297a91.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726678392; x=1727283192; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TwVG27iWjhMbbo2rXogcr5hiQ868jFDOAxTn8sf+ht8=;
        b=CSd/T809CJOJ+2gu6349uy/3/KUqP5YMV4GkaYRfVr9+xeR+LSM2SINb15JqcCaHGf
         nMYV3cG1bTcFMkUd1phNjpXu68mNHo3S6Z1/rG36YlZQX9FSDqw29JDJz60iVdf58/Cm
         7AD8WPWmLOLJMFaHnr1lEP5YXATu1S683A51ONnt+YN4H7QKK+YKo+tdl9cpXHzMbrMq
         eKUFzlGk/i6cN60v1pniouxAnDXHW+fDhb/zM6dGNFgxtx5ZiBHj87099GrY9nYl0xqc
         QELJ7tfKj0+chNoqYCslj6k/jv++E9HZMjEEvWTNuqxhxSszVuUZnUAOrhEdaFuop1CX
         nQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726678392; x=1727283192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwVG27iWjhMbbo2rXogcr5hiQ868jFDOAxTn8sf+ht8=;
        b=S9D1wrRHeXVWZPCpxD1QQEuEmgYPuoUHZx8pnz/GRsBQeODUpXizdduZrk/QP/gEjT
         51I97Blc5lnOLA5jIfRGSX64w2r1fSIyjvARKnHQFPO5zGPydF3KPrB5VZlkVkXxE888
         7I6lwbJUMFduUuXetrMYe6cRf/s/wL6PuhFx/egDZdmMppjRgjYuXaQZaMHcZDASuKEL
         VfqywVrXbe5bfoztIpUgu+xNOy/R+9vkuwG8hhinBzJyTX+Xy4feMRyfsbLXAYX2Ead/
         NY2jxlzcruGfuV+9813B8BhQpc9R3rm+G2wTEqkNLMfxf/vW2gDCjsoY7pYPd4sjPx0u
         CXPw==
X-Forwarded-Encrypted: i=1; AJvYcCXEVNin6RSrfw4mwr8MbDnVdjPParX9h8cIMBqAKEb3HOGkhcOg7XxzobY1CT1OBtq8IwMvuijzg/blUT8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqcXQpU/J+hNKUJ6J1i4e7lbeDRT+2wotqKjDeDIQbl2o/qAA7
	umzNiuN3pFgUr5bKa49iEUtvv8ioB+TPpis3XXsOM+cYusq+fxaK
X-Google-Smtp-Source: AGHT+IESeiykBWoBfHRj3NaZN3SuHuAvzzhhGH7qh4VssYv7fmnVXVd/X4/EWjz9DQQv7UGoDuV0Mg==
X-Received: by 2002:a17:90a:7345:b0:2d8:8a3a:7b88 with SMTP id 98e67ed59e1d1-2dd6cdfaefcmr427948a91.6.1726678391880;
        Wed, 18 Sep 2024 09:53:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd608e5e5esm1895404a91.33.2024.09.18.09.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 09:53:11 -0700 (PDT)
Message-ID: <f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us.net>
Date: Wed, 18 Sep 2024 09:53:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: trivial-devices: support pmbus
 compatible string
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
 <20240918095438.1345886-2-Delphine_CC_Chiu@wiwynn.com>
 <e94f03a9-92e1-47d5-aa36-fc51216436c9@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e94f03a9-92e1-47d5-aa36-fc51216436c9@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Fabio Estevam <festevam@gmail.com>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 9/18/24 06:03, Krzysztof Kozlowski wrote:
> On 18/09/2024 11:54, Delphine CC Chiu wrote:
>> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>>
>> Add pmbus compatibale string for the Generic PMbus devices that could
>> be monitor by pmbus driver.
>>
> 
> You need to explain more, provide background why we would like to accept
> a generic compatible. And why a specific compatible cannot or should not
> be used...
> 
> In general this is a no, you cannot have such compatibles for real hardware.
> 

Agreed; affected chips should be listed explicitly in drivers/hwmon/pmbus/pmbus.c.

Guenter


