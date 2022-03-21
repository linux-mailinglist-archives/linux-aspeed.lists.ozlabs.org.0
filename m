Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6114E2CD7
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 16:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMfHF20Jvz30Ph
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 02:51:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.51; helo=mail-wr1-f51.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMfH62s0Yz2yHL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 02:51:13 +1100 (AEDT)
Received: by mail-wr1-f51.google.com with SMTP id p9so21263317wra.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Mar 2022 08:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hefucE+Jiu9ept//sebHy0SZe1pf91jzk4A2hhyEoXU=;
 b=W8UmA0j+cFDNCo9BdBEZbEw1LVASxmV93i7UI0LwzWap80ou/hp/oiYLa0uqY4bzLh
 0XHiLFPMpYXUSMUsDcpGzGMGfSG2Wy8QCXNER79Ut5W6+eSrnxOvKaY41kw1ENw6kOqh
 UMMND0a2G8DBST26iFMjrj4LTBGXlCpaZgITdytN4u0v6q9UEAah/RI3mfmyWTBCTbQZ
 Ui3Iyk2hn6inP8bUTdUhiHoibmWtTeIHyI7CueX+wqWey/Pc6goV9Bow4Oxf01QcBxXq
 seiCkrgtfvgubcRHeo6TALHtX0KDy4P46HadsWw0dPRazDBYUXHpqKswHahI9H1BS1nw
 JL6Q==
X-Gm-Message-State: AOAM533deDp2f67u3Z6Wx7ewSqKumzlhovwDqjpx/igeFPcJI/Je1Psv
 rrrJ1T9tqT76l4vf6VOkv+8=
X-Google-Smtp-Source: ABdhPJwvW8A/Q2Qjh46eoL/oVh5ZiV0UasSIAFG93IFQXPqcKZSoCt5kt1x/8yu76BU3wmUskwpDfw==
X-Received: by 2002:a5d:6acd:0:b0:1ef:78e9:193a with SMTP id
 u13-20020a5d6acd000000b001ef78e9193amr18601351wrw.281.1647877869926; 
 Mon, 21 Mar 2022 08:51:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm15376362wrs.73.2022.03.21.08.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 08:51:09 -0700 (PDT)
Message-ID: <3aae94bd-d39d-ddfc-2b06-356173f6b1f8@kernel.org>
Date: Mon, 21 Mar 2022 16:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: net: add reset property for aspeed,
 ast2600-mdio binding
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, robh+dt@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
 <20220321095648.4760-2-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321095648.4760-2-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, stable@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/03/2022 10:56, Dylan Hung wrote:
> The AST2600 MDIO bus controller has a reset control bit and must be
> deasserted before the manipulating the MDIO controller.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Cc: stable@vger.kernel.org

No bugs fixes, no cc-stable. Especially that you break existing devices...

> ---
>  .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> index 1c88820cbcdf..8ba108e25d94 100644
> --- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> @@ -23,12 +23,15 @@ properties:
>    reg:
>      maxItems: 1
>      description: The register range of the MDIO controller instance

Missing empty line.

> +  resets:
> +    maxItems: 1
>  
>  required:
>    - compatible
>    - reg
>    - "#address-cells"
>    - "#size-cells"
> +  - resets

You break the ABI. This isusually not accepted in a regular kernel and
even totally not accepted accepted for stable kernel.

>  
>  unevaluatedProperties: false
>  
> @@ -39,6 +42,7 @@ examples:
>              reg = <0x1e650000 0x8>;
>              #address-cells = <1>;
>              #size-cells = <0>;
> +            resets = <&syscon 35>;
>  
>              ethphy0: ethernet-phy@0 {
>                      compatible = "ethernet-phy-ieee802.3-c22";


Best regards,
Krzysztof
