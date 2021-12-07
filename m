Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970D146B32A
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 07:46:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7W693BX1z2ymP
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 17:46:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q+yWS6Io;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Q+yWS6Io; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7W661mbwz2xXg
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Dec 2021 17:46:05 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id d2so13721796qki.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Dec 2021 22:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zbba/UkaBqT6lJeesV5XnDR8ly5tsCHkshlo7j8jGmI=;
 b=Q+yWS6IouAezP2RtXT7wfG4/tNxdp9ZXLR+wW9lKJBMyDsJlbJ5H3xZ0rKJ6fVBHbG
 dSSqWRMXnedRWTkImMBJ02GzPEnNeRFyXRgjK0GwRALs2WOZh06MkTmzmmR7igDS3WRT
 n9cK0g2H5P2BlLtjlmxoUtb2D+/i7e+uibXPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zbba/UkaBqT6lJeesV5XnDR8ly5tsCHkshlo7j8jGmI=;
 b=pVh8+W0rRI6LNTHm9V8ICMRAuNuObS+Mu/UWrfcYxNIIeH4k1/X/W/lOxRyFKWm/Rc
 DeUmRBXEmChUBlaOJTFmXwRqVzrX9UZvF8mK68FmJ2vuDuHX9NeoscL8BHKZPcRPVHFI
 NGgquKl+v6dpT7c05Tm4Y7U5RwCf5NwjuaMYwFVK8UqcqnDJHO3KG/Kt0BD8pWzzDL3f
 C6sDTQMweziQ2lk/wUJr3lXDuovzI+1XwJfX3xLo3yNJVDPBwa4FpVJRGQa9nfN5hkOX
 dcWY6jyfNeiBCdFTzfeogWinJR8HdSRqRr7tntinSKBkuq5lEUe4D23MxHMPC2MtoiLB
 2ycg==
X-Gm-Message-State: AOAM532dtkifsBxJnDmZ074rOEbun+tdMmYwz4qekLV6dO5X9aSZLflX
 Dk6zLXnk5j+0IQtKX6FsJbBG4AbRwHiMbmJiJIg=
X-Google-Smtp-Source: ABdhPJwMyI+isbOcD9jb1sDe2P/kVRSvemDmcx2g+X8998rktI8XFF6NjHYwG35zn7OuoJyPRSFLT3eZWu86DISifLQ=
X-Received: by 2002:a05:620a:1004:: with SMTP id
 z4mr37420042qkj.243.1638859560150; 
 Mon, 06 Dec 2021 22:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20211130055933.32708-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20211130055933.32708-1-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Dec 2021 06:45:47 +0000
Message-ID: <CACPK8XfM4C7v3keXaxMs9SkqNzb8XWbZ6QvcZXWcy3ZKJCrvWQ@mail.gmail.com>
Subject: Re: [v14 0/2] Support pwm driver for aspeed ast26xx
To: Billy Tsai <billy_tsai@aspeedtech.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-pwm@vger.kernel.org, BMC-SW <BMC-SW@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Tue, 30 Nov 2021 at 05:58, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The legacy driver of aspeed pwm is binding with tach controller and it
> doesn't follow the pwm framworks usage. In addition, the pwm register
> usage of the 6th generation of ast26xx has drastic change. So these
> patch serials add the new aspeed pwm driver to fix up the problem above.

Sorry for not taking a look earlier. Well done on making it this far.

There's a few things that need to be addressed before merging this.

Firstly, the bindings need fixing up. I think these should be the one
file. The device tree bindings are supposed to describe the hardware,
and it doesn't make sense to separate them out just because we plan on
using two subsystems to implement the functionality.

Rob, please chime in if you would prefer something different.

Secondly, we need to clarify why this is a pwm driver and not a hwmon
driver like we had for the 2500 hardware, and that you're planning on
submitting a hwmon driver for the other half of the registers.

Finally, do you really need to use regmap? It's lots of overhead for a
mmio driver, and I like to see it avoided where possible. I know the
regions are shared, but are there any individual registers shared?

Cheers,

Joel



>
> Change since v13:
> - pwm-aspeed-ast2600.c
>   - Fix the usage of the braces to meet the coding-style.rst
>   - Use min function to reduce the times of division.
>
> Change since v12:
> - pwm-aspeed-ast2600.c
>   - Fix the comment about the duty cycle and period of the PWM.
>   - Configured to max period when request period > max period.
>   - Remove unnecessary curly braces.
>
> Change since v11:
> - pwm-aspeed-ast2600.c
>   - Request reset controller before clock enable.
>
> Change since v10:
> - pwm-aspeed-ast2600.c
>   - Add more comment to explain the feature of PWM
>   - Fix the naming of some parameters.
>   - Set pin_enable and clk_enable at the same time.
>   - Always set fixed divisor to hw register when apply.
>
> Change since v9:
> - dt-bindings:
>   - Change the naming of tach subnode channel setting property to
>   aspeed,tach-ch.
> - pwm-aspeed-ast2600.c
>   - Fix the naming of some parameters.
>   - Capitalise error messages.
>   - Handling potentially mult overflow when .apply
>
> Change since v8:
> - pwm-aspeed-ast2600.c
>   - Replace "* _BITULL(div_h)" to "<< div_h"
>   - Fix duty_cycle precision problem.
>   - Add the comment about the formula of duty_cycle.
>
> Change since v7:
> - pwm-aspeed-g6.c
>   - Rename the driver: pwm-aspeed-g6.c -> pwm-aspeed-ast2600.c.
>   - Macro remove "_CH" part of the register name.
>   - Unroll the aspeed_pwm_get_period and remove it.
>   - Simplify the formula to get duty_pt
>   - Reduce the number of writing register. Organize all the fields and
>     write them at once.
>
> Change since v6:
> - dt-bindings:
>   - Add blank line between each DT property.
>   - Change the sub-node name from fan to tach-ch.
> - pwm-aspeed-g6.c
>   - Merge aspeed_pwm_set_period and aspeed_pwm_set_duty into .apply.
>   - Convert the factor type to u64 when calculating the period value.
>   - Using ROUND_UP strategy to calculate div_h for finer resolution.
>
> Change since v5:
> - pwm-aspeed-g6.c suggested by Uwe Kleine-K=C3=B6nig
>   - Move the divide at the end of the calculation.
>   - Unified the prefix of the function name.
>   - Use div64_u64 to calculate the divider of frequency.
>
> Change since v4:
> - dt_binding:
>   - pwm/tach yaml: Replace child-node with additionalProperties
>   - pwm-tach yaml: Replace child-node with patternProperties
> - pwm-aspeed-g6.c suggested by Uwe Kleine-K=C3=B6nig
>   - The bit definitions contained the name of the register.
>   - Remove single caller function and fold it to the caller.
>   - Avoid to divide by the result of a division.
>   - Remove unnecessary condition in .apply().
>   - Use goto for error handling
>
> Changes since v3:
> - Add the dt_binding for aspeed,ast2600-tach.
> - Describe the pwm/tach as child-node of pwm-tach mfd.
> - Complete the properties of pwm node.
>
> Changes since v2:
> - Remove the tach node, #address-cells and #size-cells from pwm-tach.yaml
> - Add clocks and reset properties to pwm-tach.yaml
> - Kconfig/Makfile sorted alphabetically
> - pwm-aspeed-g6.c suggested by Uwe Kleine-K=C3=B6nig
>   - Add more hardware descriptions at top of the driver.
>   - Remove unused api request and free
>   - Move the initialize settings of all pwm channel to probe.
>   - Change the method of getting the approximate period.
>   - Read the hardware register values to fill the state for .get_state()
>
> Changes since v1:
> - Fix the dt_binding_check fail suggested by Rob Herring
> - Add depends to PWM_ASPEED_G6 configure suggested by Uwe Kleine-Konig
> - pwm-aspeed-g6.c suggested by Uwe Kleine-K=C3=B6nig
>   - Fix license header
>   - Use bitfiled.h macro to define register fields
>   - Implement .remove device function
>   - Implement .get_state pwm api
>
> Billy Tsai (2):
>   dt-bindings: Add bindings for aspeed pwm-tach.
>   pwm: Add Aspeed ast2600 PWM support
>
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   |  68 ++++
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml |  76 ++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      |  64 ++++
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-aspeed-ast2600.c              | 325 ++++++++++++++++++
>  6 files changed, 544 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast260=
0-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-=
pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-=
pwm.yaml
>  create mode 100644 drivers/pwm/pwm-aspeed-ast2600.c
>
> --
> 2.25.1
>
