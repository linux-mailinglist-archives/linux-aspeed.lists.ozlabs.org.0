Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9D5455C0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jun 2022 22:36:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJwpg5CGsz3bsV
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 06:35:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.171; helo=mail-il1-f171.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJwpY2VxBz3blQ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jun 2022 06:35:47 +1000 (AEST)
Received: by mail-il1-f171.google.com with SMTP id p1so19570762ilj.9
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jun 2022 13:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QBDO7v65SAWGthk9Or/vLDWOZ29djnzYPLI5jGMZgQM=;
        b=1BFFlFrK25GUBETm57a+ba0qD4O8lLnJ6O87yWV/WDdRwfCWo2+EwW7icXi83Y9x/P
         3SAWiR/f4dk7ZShAlZnP0i+cpKnlrUV8h7BWKVUGF9HxGTisEqYI34VV3gVOq9hYVz5G
         6AFvND/qIoyanojPf8L9lrsOs0YEaUwzlszttoVUI+wtD4sM0SqDlMch0fzPvXDte/Ww
         nG1DvMW9LaerS+T0KDh6TkjaeIdA+WwMTN7YF1/6S9nqSmVqsbI9MlBIN6DXW57Y0rmu
         SUFml48lGVKAXaDRvspvZbv3zF2Oxc6oaH7EQKZR5aNSoAbjw7BWCI2qLdIkvwS+SUvG
         Osog==
X-Gm-Message-State: AOAM531yo/PxbvAS/iJlzUjEYD6r/QTQx3D2W9/iJ/L5+6XZUsgF/FCR
	1acKy2QIhaTUnWI4NignEQ==
X-Google-Smtp-Source: ABdhPJx/w+nY1iHBI7z9zDeV4Q2WNoBgjOGowewO0wrLqYSZkjJhQVYZ7hEjQ4BzxpX4n2jvUKXVqA==
X-Received: by 2002:a05:6e02:b26:b0:2d1:ef19:8f90 with SMTP id e6-20020a056e020b2600b002d1ef198f90mr23579045ilu.180.1654806942658;
        Thu, 09 Jun 2022 13:35:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r9-20020a02c6c9000000b00331b2dd285dsm5323726jan.177.2022.06.09.13.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:35:42 -0700 (PDT)
Received: (nullmailer pid 57211 invoked by uid 1000);
	Thu, 09 Jun 2022 20:35:40 -0000
Date: Thu, 9 Jun 2022 14:35:40 -0600
From: Rob Herring <robh@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: aspeed-i2c: add properties for
 setting i2c clock duty cycle
Message-ID: <20220609203540.GA43168-robh@kernel.org>
References: <20220607163703.26355-1-potin.lai.pt@gmail.com>
 <20220607163703.26355-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607163703.26355-3-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rayn Chen <rayn_chen@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 12:37:03AM +0800, Potin Lai wrote:
> Introduce a new property for setting a minimum duty cycle for clock high.
> 
> * i2c-clk-duty-cycle-min: a minimum percentage of clock high
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index ea643e6c3ef5..af4c49111cc0 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -49,6 +49,14 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  i2c-clk-duty-cycle-min:

i2c-clk-duty-cycle-high-min-percent

Or maybe 'i2c-clk-high-min-percent' with duty cycle being implied.

> +    $ref: /schemas/types.yaml#/definitions/uint32

With '-percent' you can drop this.

> +    minimum: 1
> +    maximum: 100
> +    default: 50
> +    description:
> +      a minimum percentage of clock high
> +
>  required:
>    - reg
>    - compatible
> -- 
> 2.17.1
> 
> 
