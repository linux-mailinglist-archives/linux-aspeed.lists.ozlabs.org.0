Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA0895B66
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Apr 2024 20:07:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r1RPYV0s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8G7S5GR3z3dX4
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 05:07:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r1RPYV0s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8G7K26yMz3dRp
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 05:07:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E08F60EE6;
	Tue,  2 Apr 2024 18:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5BCC43390;
	Tue,  2 Apr 2024 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712081241;
	bh=91aU9dbnR4oPxBkRhlJlak+TLyyFgxU3Lj4fxkKRr9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1RPYV0snTHr8XNu7hM42QYJtoX68fM9iLvZliNyeCGev47mk1JODdjDlu5ar41B4
	 6pn0El/Lr6OJTo2/C18KeNC1wWP7RQNZF6umxfF5N2WVhdnViYKfw4RTxSn0dM29O1
	 hBlhBLjP+hKgzmrf8Ehq0apqRebcAwJl2qq0nh1hiZvdRsC6jYr73pdGpvae+hkZpT
	 qU/HA6X46Sa6qxdEKjYpYLdcgrwl5Ah3mQhAUgBED9ZEZ9J8PAxJhsJ1KNjN6AllvI
	 z31kvdLr/onRC4bBrpLy+1SM6bUh8rsF4dh8B3l9r9/kTV6jIFfiEmJytW0mD+DUXt
	 Wo5yCshpszXtw==
Date: Tue, 2 Apr 2024 13:07:18 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert Aspeed binding to DT
 schema
Message-ID: <20240402180718.GA358505-robh@kernel.org>
References: <20240402120118.282035-1-andrew@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402120118.282035-1-andrew@codeconstruct.com.au>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, zev@bewilderbeest.net, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 10:31:18PM +1030, Andrew Jeffery wrote:
> Squash warnings such as:
> 
> ```
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e600000/watchdog@1e785000: failed to match any schema with compatible: ['aspeed,ast2400-wdt']
> ```
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml | 130 ++++++++++++++++++
>  .../bindings/watchdog/aspeed-wdt.txt          |  73 ----------
>  2 files changed, 130 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> new file mode 100644
> index 000000000000..10fcb50c4051
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed watchdog timer controllers
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@codeconstruct.com.au>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-wdt
> +      - aspeed,ast2500-wdt
> +      - aspeed,ast2600-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true

# and order/function if more than 1 must be defined.

Please note it was missing from the original binding in the commit 
message.

> +
> +  aspeed,reset-type:
> +    enum:
> +      - cpu
> +      - soc
> +      - system
> +      - none
> +    description: |
> +      Reset behaviour - The watchdog can be programmed to generate one of three
> +      different types of reset when a timeout occcurs.
> +
> +      Specifying 'cpu' will only reset the processor on a timeout event.
> +
> +      Specifying 'soc' will reset a configurable subset of the SoC's controllers
> +      on a timeout event. Controllers critical to the SoC's operation may remain untouched.
> +
> +      Specifying 'system' will reset all controllers on a timeout event, as if EXTRST had been asserted.
> +      Specifying "none" will cause the timeout event to have no reset effect.
> +      Another watchdog engine on the chip must be used for chip reset operations.
> +
> +      The default reset type is "system"

Express as schema:

default: system

> +
> +  aspeed,alt-boot:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |

Don't need '|' if no formatting to preserve.

> +      Direct the watchdog to configure the SoC to boot from the alternative boot
> +      region if a timeout occurs.
> +
> +  aspeed,external-signal:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Assert the timeout event on an external signal pin associated with the
> +      watchdog controller instance. The pin must be muxed appropriately.
> +
> +  aspeed,ext-pulse-duration:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The duration, in microseconds, of the pulse emitted on the external signal pin

Wrap at <80. Period at end needed.

> +
> +  aspeed,ext-push-pull:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      If aspeed,external-signal is specified in the node, set the external
> +      signal pin's drive type to push-pull. If aspeed,ext-push-pull is not
> +      specified then the pin is configured as open-drain.
> +
> +  aspeed,ext-active-high:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      If both aspeed,external-signal and aspeed,ext-push-pull are specified in
> +      the node, set the pulse polarity to active-high. If aspeed,ext-active-high
> +      is not specified then the pin is configured as active-low.
> +
> +  aspeed,reset-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      A bitmaks indicating which peripherals will be reset if the watchdog
> +      timer expires. On AST2500 SoCs this should be a single word defined using
> +      the AST2500_WDT_RESET_* macros; on AST2600 SoCs this should be a two-word
> +      array with the first word defined using the AST2600_WDT_RESET1_* macros,
> +      and the second word defined using the AST2600_WDT_RESET2_* macros.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      anyOf:
> +        - required:
> +            - aspeed,ext-push-pull
> +        - required:
> +            - aspeed,ext-active-high
> +        - required:
> +            - aspeed,reset-mask
> +    then:
> +      properties:
> +        compatible:
> +          enum:
> +            - aspeed,ast2500-wdt
> +            - aspeed,ast2600-wdt
> +  - if:
> +      required:
> +        - aspeed,ext-active-high
> +    then:
> +      required:
> +        - aspeed,ext-push-pull
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    wdt1: watchdog@1e785000 {

Drop unused labels.

> +        compatible = "aspeed,ast2400-wdt";
> +        reg = <0x1e785000 0x1c>;
> +        aspeed,reset-type = "system";
> +        aspeed,external-signal;
> +    };
> +  - |
> +    #include <dt-bindings/watchdog/aspeed-wdt.h>
> +    wdt2: watchdog@1e785040 {
> +        compatible = "aspeed,ast2600-wdt";
> +        reg = <0x1e785040 0x40>;
> +        aspeed,reset-mask = <AST2600_WDT_RESET1_DEFAULT
> +                            (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> deleted file mode 100644
> index 3208adb3e52e..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -Aspeed Watchdog Timer
> -
> -Required properties:
> - - compatible: must be one of:
> -	- "aspeed,ast2400-wdt"
> -	- "aspeed,ast2500-wdt"
> -	- "aspeed,ast2600-wdt"
> -
> - - reg: physical base address of the controller and length of memory mapped
> -   region
> -
> -Optional properties:
> -
> - - aspeed,reset-type = "cpu|soc|system|none"
> -
> -   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
> -   to generate one of three different, mutually exclusive, types of resets.
> -
> -   Type "none" can be specified to indicate that no resets are to be done.
> -   This is useful in situations where another watchdog engine on chip is
> -   to perform the reset.
> -
> -   If 'aspeed,reset-type=' is not specified the default is to enable system
> -   reset.
> -
> -   Reset types:
> -
> -        - cpu: Reset CPU on watchdog timeout
> -
> -        - soc: Reset 'System on Chip' on watchdog timeout
> -
> -        - system: Reset system on watchdog timeout
> -
> -        - none: No reset is performed on timeout. Assumes another watchdog
> -                engine is responsible for this.
> -
> - - aspeed,alt-boot:    If property is present then boot from alternate block.
> - - aspeed,external-signal: If property is present then signal is sent to
> -			external reset counter (only WDT1 and WDT2). If not
> -			specified no external signal is sent.
> - - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
> -
> -Optional properties for AST2500-compatible watchdogs:
> - - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
> -			 drive type to push-pull. The default is open-drain.
> - - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
> -			   is configured as push-pull, then set the pulse
> -			   polarity to active-high. The default is active-low.
> -
> -Optional properties for AST2500- and AST2600-compatible watchdogs:
> - - aspeed,reset-mask: A bitmask indicating which peripherals will be reset if
> -		      the watchdog timer expires.  On AST2500 this should be a
> -		      single word defined using the AST2500_WDT_RESET_* macros;
> -		      on AST2600 this should be a two-word array with the first
> -		      word defined using the AST2600_WDT_RESET1_* macros and the
> -		      second word defined using the AST2600_WDT_RESET2_* macros.
> -
> -Examples:
> -
> -	wdt1: watchdog@1e785000 {
> -		compatible = "aspeed,ast2400-wdt";
> -		reg = <0x1e785000 0x1c>;
> -		aspeed,reset-type = "system";
> -		aspeed,external-signal;
> -	};
> -
> -	#include <dt-bindings/watchdog/aspeed-wdt.h>
> -	wdt2: watchdog@1e785040 {
> -		compatible = "aspeed,ast2600-wdt";
> -		reg = <0x1e785040 0x40>;
> -		aspeed,reset-mask = <AST2600_WDT_RESET1_DEFAULT
> -				     (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
> -	};
> -- 
> 2.39.2
> 
