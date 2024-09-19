Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2797C48A
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 08:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8RDw5ssDz2yMD
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 16:58:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726729103;
	cv=none; b=Icomn03l9Ht1qRIWZNbRqQHIfPz4lasnat++Q8UWzgLCidJx0Y5Yp6CuzGuEnV/jRu/rKK3/NkKbrJ7KI158StsxKCz7RKLX1WEl2RMZChGemJ/IlWY682Cqp5wUMMNMpSqZ5Co3vJXYpL3XEwiGV1n38CFDI/+C8uT5PveaOM7o4Rz20wUTTS6nSdiTI9JqYRgtT70rbaAeC4cf8TxylHaCZwNKdmj0O5Dp/zMUdPHgyVSq6giTqdgke5ES1YbIXYJQ08vHi5IeMnT/ASGAhy2K0QlPZmQih817P6wx5PTBVwxd5b6YultzGwmNzEL/vddcwqHQzwWa41umc9w8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726729103; c=relaxed/relaxed;
	bh=qvHJol6L5P02gH+LQAtKdsl7WA3VYCSuvzbhglI++Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Jka2Nr49cexx6zf/AxNx+D3LoBoz9QGvRieL1GTbSQ9BXWgw61FHe6oP1+VR2YfUjEvXKS+QJQdR4UGPowpq430R4+RS2DflMEdLht6h5vNGwBqAlAdeR5u6UYaoR00Q6eYegFCO90wqI3tlWzJ7ar2arsywrlGKfapV4NhL10Rnh2HM5faZb9+E9GTlq+3h7504KCjAyK74XkUzTGbHq288XTtSKA4/qiWR6NXbJrgDyPlvdzUZ71iiJOv8pnjvheVnspr7Q4QOgKRaRIM9056znQnO2Ze9dsfz7UdvO9s8IDPacBkXOr+yWzIAvAjmCdxx7QC3h0taGR2GwsJ32A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a57OZkQa; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a57OZkQa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8RDv1MxNz2xHP
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 16:58:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 609E05C4638;
	Thu, 19 Sep 2024 06:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28420C4CEC4;
	Thu, 19 Sep 2024 06:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726729100;
	bh=9nAAqlkZKYZfGfpiwhBJTJ0OpaigkF/Yg1OCPN+DQDY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=a57OZkQaISJR9pevwvenRJhjMsji5Nh16A9bNVdWyERJG4qEePMxH5MxFZpRThbA7
	 AY52hwTCJp+LW9W1eZ/WRtl/pnhQXPwk8lr1A0ejgzHc4mHv00XMOS8UKm0A6/jJ4S
	 24hsr1FcMyX3fr1Y2OSDLjISOoFtfcDLl6wS3wnygJkXpIJTkb8YP85bzQaqeUeZnl
	 7lXPgC7SZlIGvtKzuWG2cnjlOBoYmu2ZqsSOUVSlpUI85MWp16EcF4ZjhaV3l2X7m4
	 LvWD4vDIeScxWGjevtJ+O2KJRVDekGW3Z9GvmD1AZlhEmSwH7mVwILdrpDx+m/JHVz
	 wWr5gO+pTG/jA==
Message-ID: <195a8bfe-e4d7-4140-9635-b86a6ce3c663@kernel.org>
Date: Thu, 19 Sep 2024 08:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: Add AST2700 bindings
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
 <20240916091039.3584505-3-ryan_chen@aspeedtech.com>
 <b9bf19af-0c3c-4622-9124-a66d9df649b2@kernel.org>
 <OS8PR06MB754148AD165538D3D6B6C3DDF2632@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB754148AD165538D3D6B6C3DDF2632@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 19/09/2024 08:01, Ryan Chen wrote:
>> Subject: Re: [PATCH v3 2/4] dt-bindings: Add AST2700 bindings
>>
>> On 16/09/2024 11:10, Ryan Chen wrote:
>>> Add reset, clock dt bindings for AST2700.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>  .../dt-bindings/clock/aspeed,ast2700-clk.h    | 163
>> ++++++++++++++++++
>>>  .../dt-bindings/reset/aspeed,ast2700-reset.h  | 124 +++++++++++++
>>>  2 files changed, 287 insertions(+)
>>
>> This is supposed to be part of the commit adding these bindings. You got this
>> comment already, didn't you?
> 
> Sorry, I may mis-understood your point in previous.
> I think you are ask, yaml and dt-binding header to be the same patch, right?

It is one patch adding the binding for the device and headers.

> 
>>
>>>  create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
>>>  create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h
>>>
>>> diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>> b/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>> new file mode 100644
>>> index 000000000000..63021af3caf5
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>
>> Use compatible as filename.
> Modify from aspeed,ast2700-clk.h to aspeed, clk-ast2700.h, is it ok?
> How about the aspeed,ast2700-reset.h file name is ok ?

No. For both use the same filename, so the full compatible. FULL.

Best regards,
Krzysztof

