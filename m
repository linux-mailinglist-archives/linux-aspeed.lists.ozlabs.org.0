Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19B57C53F
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 09:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpPH216CKz3c5q
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 17:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tYHFkxpw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tYHFkxpw;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpPGy0qYFz302W
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 17:25:11 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id q7so774427lji.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=2mcFMkdFlegyaGlkJRzck9ynacBYIr8JIQrrqE1QtHQ=;
        b=tYHFkxpwdcnUQpnCYyayLPi5CzFc6YrNc6lB9ARelLymRoQOmIWGwVOVMw2fjkrtXg
         hkFHzRYZ2NTtDe++JKiaEJHGTXMIUmMtFZLi16uOUJoXlZIQAi26VkO0noApt5cdeI02
         TN8Cgk23ccoqT5IrgxpzlzXMxyK7vcQ4FwIYkWjAOofT9KHpghFf2IC0JD2uoAaT9ZiQ
         Bj1QYc7F9vgpXSK4LdEPm+FSiK8rm9m37EgvtUXHCj2ud4oqkhb3w3NKeNo/uMnpMTms
         E19aZ0ZQwbR5WsIHGfvcS446TUH+d2xVbUEQT7iMldQU0GmiZFrbAViKmk6OnQ2ux3Sj
         Si9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=2mcFMkdFlegyaGlkJRzck9ynacBYIr8JIQrrqE1QtHQ=;
        b=EeDW/Wh8mB/yNTABaNeu0U7WrHduMlL8SI2JwXXM85W+8489fI6hQp3Urs7H102yKx
         j4wEX2kgkR+sQcokgCAedLiHJHCDOIF/5PuqM/XjPgpZpkLTaVqaMjIsd6gA1tMf0aR2
         xk0tPzW0hsVihEevWbU54DZwAsKDIBi3qQ/oGng8hYNC5byGjbRJiV0S3CVjOtMkduyi
         pjghe8Bc4ex5JICb25z389Ij7iO1vWIiXmJHsDCA1xBX7tIsq0Wur7BqE+zugTfw9wp4
         cMv7AnXrZNlejJUSCHnaD+i+oL2STpZWTLfKc2d5xvJTKl+kN2Q/F7EibTx1Rh4N+MZ6
         DHcQ==
X-Gm-Message-State: AJIora+P5Q1rHgmgVHG1YHhxJTkr5j4IEFdxt3QYGb5aBGF7NesogeDW
	Y5k/JMtqyzBu5vQs2BzunALADQ==
X-Google-Smtp-Source: AGRyM1swyaJylpQW1HUAs/YKi2zAEaOv5XArks69BMBBv+GjPdFriuSjdzcx9tFrEZcjg8uQ4H+/9w==
X-Received: by 2002:a2e:9c5a:0:b0:25d:dad5:1e04 with SMTP id t26-20020a2e9c5a000000b0025ddad51e04mr1198656ljj.428.1658388307218;
        Thu, 21 Jul 2022 00:25:07 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id r26-20020ac252ba000000b00489e011bad7sm260305lfm.218.2022.07.21.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 00:25:06 -0700 (PDT)
Message-ID: <1f0f2083-3100-a2d4-d513-52869b5aa706@linaro.org>
Date: Thu, 21 Jul 2022 09:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: document several
 vendors for Aspeed BMC boards
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Steven Lee <steven_lee@aspeedtech.com>, Ken Chen <chen.kenyy@inventec.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <c86be8e0-8350-5d73-8055-e04a4e88f3b6@linaro.org>
 <42fb4884-e2c3-4d7f-9049-f14c19701b20@www.fastmail.com>
 <fb1b5eed-41ed-2c4b-c984-235ec4b3b0f6@linaro.org>
In-Reply-To: <fb1b5eed-41ed-2c4b-c984-235ec4b3b0f6@linaro.org>
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
Cc: David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/07/2022 08:30, Krzysztof Kozlowski wrote:
> On 21/07/2022 04:34, Andrew Jeffery wrote:
>>> Any comments on this patchset? Are you going to pick it up? If you
>>> prefer me taking it, I can, but new boards depend on the bindings, so
>>> this should rather go via your tree.
>>
>> Apologies for not getting to this earlier, but I see Rob's applied it.
> 
> Rob took only the first patch - vendor-prefix. The DTS patches I sent to
> arm-soc.
> 
> However the second bindings patch [1] will miss merge window as I did
> not send it to arm-soc. I have it in my tree but I am not planning to
> push it out before merge window.
> 

I sent pull with the bindings now.

Best regards,
Krzysztof
