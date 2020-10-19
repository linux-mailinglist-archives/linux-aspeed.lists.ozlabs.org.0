Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBC293068
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Oct 2020 23:22:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFV8j2c6rzDqX2
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Oct 2020 08:22:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFV8X5xmyzDqL4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Oct 2020 08:22:36 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id e20so1145404otj.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Oct 2020 14:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kb2FOP10/CSY2+K+fOQqeeT9YIluintmnWiaKshoetI=;
 b=B3LQvE28lbEolQ4dyewEgIassUnYgPbq9Ip9GFjTiwfU/zbVcyNH7plKuuRPe8WKLL
 BcDFSHZcWy1ypMGLmkd4/AmcVzJQD8NaWaPnV9do5itf4spxMqoLofai1dbVfnwj9iaE
 FNIvADTbNm6GY2Tpart400kBNxUQ5hZxCDf5DQHbTOcVrrMIYc1N5ycmM4fwMO5BKCkf
 Ds1YYx9Gu2BltfFjDP/nZHPoRsac255FdBnTHXZnT5lP4NZaJ8k9rpeE/czfIkYph5P6
 GzprnOpPKHIkGDQv8RjlG54a5oeLf2cyPEVqaeKibiZaXghiYEqUxaKoCEvpk+t7L597
 aASw==
X-Gm-Message-State: AOAM531ayGQDdgrovgz8+sftJxetcATbYOVl//VXihmntidldAsXwOGM
 bAM7HfYMSLNCFNa+BxyM7g==
X-Google-Smtp-Source: ABdhPJyIWuzhsUB3Qe9Fh0vC/maeBOYyf2zyXdqtFSd95qu5nrMOWMpgVAvxAWWAnOy1okFxqHYCKA==
X-Received: by 2002:a05:6830:1de6:: with SMTP id
 b6mr1360403otj.37.1603142553829; 
 Mon, 19 Oct 2020 14:22:33 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm307564ooi.41.2020.10.19.14.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:22:33 -0700 (PDT)
Received: (nullmailer pid 3624234 invoked by uid 1000);
 Mon, 19 Oct 2020 21:22:32 -0000
Date: Mon, 19 Oct 2020 16:22:32 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 3/3] dt-bindings: Change the meaning of clock-frequency
Message-ID: <20201019212232.GA3619458@bogus>
References: <20201016062602.20014-1-billy_tsai@aspeedtech.com>
 <20201016062602.20014-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016062602.20014-4-billy_tsai@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 vernon.mauery@linux.intel.com, haiyue.wang@linux.intel.com,
 james.feist@linux.intel.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 16, 2020 at 02:26:02PM +0800, Billy Tsai wrote:
> Integration of the usage of msg-timing and addr-timing to clock-frequency.
> User can just set it to adjust the peci work efficient.

You're breaking the ABI changing this.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 56 +++++++++----------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> index 0f5c2993fe9b..7c6c895784af 100644
> --- a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> @@ -40,31 +40,33 @@ properties:
>      maxItems: 1
>  
>    clock-frequency:
> -    # Operation frequency of PECI controller in units of Hz.
> -    minimum: 187500
> -    maximum: 24000000
> -
> -  msg-timing:
> -    description: |
> -      Message timing negotiation period. This value will determine the period
> -      of message timing negotiation to be issued by PECI controller. The unit
> -      of the programmed value is four times of PECI clock period.
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32
> -      - minimum: 0
> -        maximum: 255
> -        default: 1
> -
> -  addr-timing:
> -    description: |
> -      Address timing negotiation period. This value will determine the period
> -      of address timing negotiation to be issued by PECI controller. The unit
> -      of the programmed value is four times of PECI clock period.
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32
> -      - minimum: 0
> -        maximum: 255
> -        default: 1
> +    # The bit frequency of PECI negotiation stage in units of Hz.
> +    # Driver will calculate the best divisor setting of msg-timing and
> +    # addr-timing to meet the value.

Use 'description' rather than comments.

> +    minimum: 2000
> +    maximum: 2000000
> +
> +  # msg-timing:
> +  #   description: |
> +  #     Message timing negotiation period. This value will determine the period
> +  #     of message timing negotiation to be issued by PECI controller. The unit
> +  #     of the programmed value is four times of PECI clock period.
> +  #   allOf:
> +  #     - $ref: /schemas/types.yaml#/definitions/uint32
> +  #     - minimum: 0
> +  #       maximum: 255
> +  #       default: 1

Why is this commented out?

> +
> +  # addr-timing:
> +  #   description: |
> +  #     Address timing negotiation period. This value will determine the period
> +  #     of address timing negotiation to be issued by PECI controller. The unit
> +  #     of the programmed value is four times of PECI clock period.
> +  #   allOf:
> +  #     - $ref: /schemas/types.yaml#/definitions/uint32
> +  #     - minimum: 0
> +  #       maximum: 255
> +  #       default: 1
>  
>    rd-sampling-point:
>      description: |
> @@ -114,9 +116,7 @@ examples:
>              interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>              clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>              resets = <&syscon ASPEED_RESET_PECI>;
> -            clock-frequency = <24000000>;
> -            msg-timing = <1>;
> -            addr-timing = <1>;
> +            clock-frequency = <2000000>;
>              rd-sampling-point = <8>;
>              cmd-timeout-ms = <1000>;
>          };
> -- 
> 2.17.1
> 
