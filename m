Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B64E72EB
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ1P429tTz308h
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:19:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.45; helo=mail-ej1-f45.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ1P15jClz2xWc
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 23:19:32 +1100 (AEDT)
Received: by mail-ej1-f45.google.com with SMTP id p15so14983417ejc.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 05:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y3vrDBUv6F9OT8Q/6qXmmtUzzQHr9b7FoLwXkymKYc4=;
 b=gRBDiTbedEn95Xi8DM9S3ecbFlnEpvB9UF+Npl3EM0mZNkclJ/xwNYyZN2TEQr2cQ1
 ZlXijIm0DyyM+onHVXrJRQu94qYAmGgc84o5dhkCtQ8svvJ0Z1va5v5LwTd6YFaago5T
 SMZqWBfPHpZcd80i1qxDtgPoj5xIVgrTT0AJknbxRu8LwGcflIYYhu9aWhK53MrrUsvh
 BDibU+wKuzGX2XSI8ZviFiz/aab49AqPieuPHJZB11kQPeV+3PAZhGZS40yHi/9jM3zQ
 l6phpTDVRmDfT+PzN3z8n0hKLlOCPtmEMInhD3hWH2LfRKZ+93t9KPa4K3IOpSNwgV8i
 QVxA==
X-Gm-Message-State: AOAM530ZkLQQX6cmNhegHUSziCV2hReT0uB7UOkltn/Mc7fEB13+xqcT
 0ujcsN3SeUnxB7e9trfCKCI=
X-Google-Smtp-Source: ABdhPJytFk/12sSW56j6ZbwpfMF+jf7c9WhUQs39ePFYQpRqrIpJQhMo/kKoPDs/mZ+HODgX2+MQSg==
X-Received: by 2002:a17:907:7f8c:b0:6e0:614f:f13e with SMTP id
 qk12-20020a1709077f8c00b006e0614ff13emr11250757ejc.488.1648210769760; 
 Fri, 25 Mar 2022 05:19:29 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 j11-20020a056402238b00b00419181bb171sm2703528eda.38.2022.03.25.05.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 05:19:29 -0700 (PDT)
Message-ID: <6c44b745-36c7-4d28-74ea-590011892658@kernel.org>
Date: Fri, 25 Mar 2022 13:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add reset property for aspeed,
 ast2600-mdio binding
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, robh+dt@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20220325041451.894-1-dylan_hung@aspeedtech.com>
 <20220325041451.894-2-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325041451.894-2-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 25/03/2022 05:14, Dylan Hung wrote:
> The AST2600 MDIO bus controller has a reset control bit and must be
> deasserted before manipulating the MDIO controller. By default, the
> hardware asserts the reset so the driver only need to deassert it.
> 
> Regarding to the old DT blobs which don't have reset property in them,
> the reset deassertion is usually done by the bootloader so the reset
> property is optional to work with them.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
