Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4E8BBAF6
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 May 2024 13:50:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jdh6kJvj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWmFv14jBz30TZ
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 May 2024 21:50:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jdh6kJvj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWmFh4p7qz2yvv;
	Sat,  4 May 2024 21:50:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5AB51CE0613;
	Sat,  4 May 2024 11:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A850C072AA;
	Sat,  4 May 2024 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714823428;
	bh=dq8QtycUf+wkQxrsoNbONtWcPfDnxfNHqIFbsIOuZEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jdh6kJvjTYBynzpzQN7moyxVLm3dZ7tmkxjfREYMS/6Ad6NdcVwkgY8UQ2DgBgrx7
	 +m5RLs2ZY/bj6ILCJET3a8LXjVjI3p3t46QaL5jeGrmcdFgE3bGeHlUDow1G0Y7WUE
	 wY/jZykqJUydPDJs8CrRQPSZPQbokSrFbLAHEMUubgVxDf7S9BtPYvRvtzzyAzdLhr
	 UFax9vUd9zstdkLUeTh035sjDYsVggpuGkP9VdXgBflO3o6JrsB4rgRyxfYEWBFsw8
	 vCyU9Yf/N7vJMN4oE0WHIFfNfoa83jSS2fmy6ViuRgc76zPc1P0dAtO8J3Pd6DBJGM
	 XWq/zYcDYOdjg==
Message-ID: <e98ade57-0646-49d4-8b41-ab6f936bb1f0@kernel.org>
Date: Sat, 4 May 2024 13:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] dt-bindings: fsi: p9-occ: Convert to json-schema
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-5-eajames@linux.ibm.com>
 <0fcadbe6-7615-498e-89c0-e3b072c4828c@kernel.org>
 <e3601656-84d3-47e1-9cbd-d2cb0dde5f51@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e3601656-84d3-47e1-9cbd-d2cb0dde5f51@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/05/2024 17:59, Eddie James wrote:
> 
> On 4/30/24 01:53, Krzysztof Kozlowski wrote:
>> On 29/04/2024 23:01, Eddie James wrote:
>>> Conver to json-schema for the OCC documentation. Also document the fact
>>> that the OCC "bridge" device will often have the hwmon node as a
>>> child.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>> Changes since v3:
>>>   - Move required below other properties
>>>   - Drop "occ-" in child node
>>>   - Drop hwmon unit address
>>>   - Complete example
>>>   - Change commit message to match similar commits
>>>
>>>   .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
>>>   .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 41 +++++++++++++++++++
>>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>> deleted file mode 100644
>>> index e73358075a90..000000000000
>>> --- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>> +++ /dev/null
>>> @@ -1,16 +0,0 @@
>>> -Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
>>> ------------------------------------------------------------------------------
>>> -
>>> -This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
>>> -a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
>>> -nodes. The OCC is not an FSI slave device itself, rather it is accessed
>>> -through the SBE FIFO.
>>> -
>>> -Required properties:
>>> - - compatible = "ibm,p9-occ" or "ibm,p10-occ"
>>> -
>>> -Examples:
>>> -
>>> -    occ {
>>> -        compatible = "ibm,p9-occ";
>>> -    };
>>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>>> new file mode 100644
>>> index 000000000000..3ab2582cb8a0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>>> @@ -0,0 +1,41 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: IBM FSI-attached On-Chip Controller (OCC)
>>> +
>>> +maintainers:
>>> +  - Eddie James <eajames@linux.ibm.com>
>>> +
>>> +description:
>>> +  The POWER processor On-Chip Controller (OCC) helps manage power and
>>> +  thermals for the system, accessed through the FSI-attached SBEFIFO
>>> +  from a service processor.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ibm,p9-occ
>>> +      - ibm,p10-occ
>>> +
>>> +patternProperties:
>>> +  "^hwmon":
>> And now it raises questions:
>> 1. Other devices on FSI bus have unit addresses, so why this does not?
>> 2. This suggest only one hwmon, so ^hwmon$, which is then not a
>> patternProperty but property.
>> 3. But the true problem why do you even need two empty nodes? These
>> should be combined into one node.
> 
> 
> 1. This is not truly on the FSI bus. It is on the SBEFIFO "bus"
> 
> 2. True enough, I'll change it to property.
> 
> 3. If this binding was being designed now, I'd agree with you, but the 
> two nodes (occ and occ-hwmon) are already documented, I'm just changing 
> to yaml here... Changing that would require a lot of changes and would 
> break the two drivers.

No child was documented before and documenting things post-factum does
not allow to bypass regular review rules.

Best regards,
Krzysztof

