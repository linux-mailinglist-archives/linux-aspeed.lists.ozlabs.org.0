Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C52882D4BD
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Jan 2024 08:56:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YrhFa/ky;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TD4Gk2wysz3bmq
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Jan 2024 18:56:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YrhFa/ky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TD4GZ0vqyz30ft
	for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Jan 2024 18:56:35 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e835800adso9106337e87.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 14 Jan 2024 23:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705305389; x=1705910189; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjl+Gf77UzHXhdhmcknsOd2nnETCByNyOlZH40OVLb0=;
        b=YrhFa/kygUR/O95LAHyvVxVx19IIXdDSY0C1tEAZ42HqGWextmf1f/nklDDIxd2gNP
         ESnZs5+5Jv9o1P6IDtNYJobTRLoP8vT1Ca5SgOO+qq2WGat9AYThqeFEFIgeYc+oVMKm
         EkI+9CP9DNUuOuMoBUDSkMVH8EafNKWjM7W6fNSMfc4ha+s8FZxtK/kYUnBI0en8fIqj
         rvMdYjhnBHcigXXZLGLmnmB+Zu+iCgkEKYMbP/T87qge13WcOHP6qd14Hy2ZXU3WPv9U
         3aj71Ub8jUtO5ZduE9gL9sA8/dPFjRX68kyUtyYCBX5YHh6wyH2+yFDy9WJwHRDyCrsq
         RHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705305389; x=1705910189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjl+Gf77UzHXhdhmcknsOd2nnETCByNyOlZH40OVLb0=;
        b=pI29i5YGrQJ7ztkwaKAUw5cMZvygVg7HR6f9OjgKRUFRSDl6V8t3TSJDTeqZchqRLe
         5gZQfTURvU0nzIchcO85D+OPKFKA36UVB3lr+JrcUZnGisx1tsIYGan28J8vWH5RW1gc
         PsjGDj7DdcWuYbF0cm9JsU8ZQeNX8mHpPfIQB6nPHzoPiRM0TmcJrCO/20LQEBRyz6UP
         d/uu4dFcZ6zuwUJRiVvf02TurAMwleQ1aNsNZe8Yl6jCsGjKyboEOIT0MXie7y3yGDnh
         gw0NHWpUpP7D5/qCT3RAF82/F6gfp1zFLDWe2B5cqZqSiqGptxfSUj/JvJVlhRt7Rus6
         9d7g==
X-Gm-Message-State: AOJu0YxHHEsV/swI+OThP4t0UlzK5KeuO4QlzrWABO6iQ4EhwfjOtZFX
	FBDJeRJoiWxMqMgOAHi8PsdeHRLP+Ge2+A==
X-Google-Smtp-Source: AGHT+IEUQ7e0ADO3LPmtiqCWhFwJw8VlGp5b8XS/9/XC91Kr5sIUOu7KG9deeuEgmHlbMuPRqZJUQw==
X-Received: by 2002:a05:6512:3a96:b0:50e:b3e4:a475 with SMTP id q22-20020a0565123a9600b0050eb3e4a475mr1969400lfu.114.1705305389678;
        Sun, 14 Jan 2024 23:56:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id r7-20020aa7cfc7000000b00557075b4499sm5182877edy.58.2024.01.14.23.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 23:56:29 -0800 (PST)
Message-ID: <40210196-3852-4c8b-94e6-e744890f003f@linaro.org>
Date: Mon, 15 Jan 2024 08:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>
References: <20240108074348.735014-1-billy_tsai@aspeedtech.com>
 <20240108074348.735014-3-billy_tsai@aspeedtech.com>
 <20240113015556.GA3829553-robh@kernel.org>
 <OSQPR06MB725208AEF8779B0BC971DFF48B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <OSQPR06MB725208AEF8779B0BC971DFF48B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 15/01/2024 08:05, Billy Tsai wrote:
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/aspeed-clock.h>
>>> +    pwm_tach: pwm-tach-controller@1e610000 {
>>> +      compatible = "aspeed,ast2600-pwm-tach";
>>> +      reg = <0x1e610000 0x100>;
>>> +      clocks = <&syscon ASPEED_CLK_AHB>;
>>> +      resets = <&syscon ASPEED_RESET_PWM>;
>>> +      #pwm-cells = <3>;
>>> +
>>> +      fan-0 {
>>> +        tach-ch = /bits/ 8 <0x0>;
>>> +      };
>>> +
>>> +      fan-1 {
>>> +        tach-ch = /bits/ 8 <0x1 0x2>;
>>> +      };
> 
>> NAK on this based on how you are using pwm-fan in v10 discussion. See my
>> comments there.
> 
> Okay, I will merge everything from the pwm-fan0 node into the fan-0 node
> and add the 'simple-bus' to the compatible string of the pwm_tach node.

What simple-bus has anything to do with it? This is not a bus. Just to
remind: we talk about bindings, not driver.

Best regards,
Krzysztof

