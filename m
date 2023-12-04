Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE40802D87
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 09:49:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LOGzU68Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkHQT2914z3cNt
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 19:49:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LOGzU68Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkHQK5CVHz2xdX
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 19:48:56 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso2217918a12.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Dec 2023 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701679734; x=1702284534; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ST2h/PONfnZyu/0urr3vsm15K/qMqFc6bAJOz5sjZGk=;
        b=LOGzU68ZTfl7hGMzo1xJbzLDnSVTM12PNRNqbX9gk2BZUPzFN6Z9Ti0ckac6g8c9NV
         6z/VSc3rsnIQzL+ir2VyRAe37c+tLWyoOmPi3PfmT0WUBQIcuVDoy4BiOmX0gUoROSgb
         bUUtumgx4e4ByAah+D1WGqeaSNbcLMtZgmHBq1eE0cTZKu/AJn5vTke8bM9alba6Uf6X
         p7CAx/8sLd6XaaLwEVd2pNhbv4h4M3naED4Fb1Hi96dhf3M8pbm/GqkoKMzHQOHZP1mR
         8HIAIc9fsMS69t0Blt64biThhCaC5smb3+vsRquV5XB+nw4sQDfMRrDP18bPUHmnJ9hZ
         eEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679734; x=1702284534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ST2h/PONfnZyu/0urr3vsm15K/qMqFc6bAJOz5sjZGk=;
        b=Rmr6vMH0pFt3MGFXiRkoYOmwfJnaGqZjRBnqc/0zxwH2liFMtKKTvcUxquo7TpsATC
         yDEsMc8qjPoTfn6Xr3d0HvMRaxURV+F8oOE3KgOMQJs3/qR6PqPHYgB9UiE1hVJ4j+ZV
         PYEu31E0/fPznrCrbL07gTuaW9dx6XDYGzNjOViz5hHPQ1+AxRFEUMGR6MYeuOOtXMQB
         0KbRZ0ZeshbuPvk1iOg9iy8D03DGHiI4TBdG/u806ePPfbGuexgzPLG9xmwduZLzlgMJ
         z2dtFgs7c19gpN/E0lIcjJ/VQXi4JRfMWs9kV/BH6M/dsTg+M0kOFkN5p9sju958MqaK
         BLJw==
X-Gm-Message-State: AOJu0Yy/J3xTc+WZ2dSlqaN03dTSx7TxZQwituUiS9ZHtOT3k/nL4ksa
	HXUq8IoAEVcbqn89KXgudZFFlI4iVp8=
X-Google-Smtp-Source: AGHT+IFn9+aaDvJQIaTTT9fhCQOFpYf2DG2sHOPojRJV8T11hDylXF7KIzTFFXItytXtfbP6QIHFjw==
X-Received: by 2002:a05:6a21:1cb0:b0:18f:97c:8a3a with SMTP id sf48-20020a056a211cb000b0018f097c8a3amr3614507pzb.101.1701679733801;
        Mon, 04 Dec 2023 00:48:53 -0800 (PST)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id v4-20020a634644000000b0058901200bbbsm7186819pgk.40.2023.12.04.00.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 00:48:53 -0800 (PST)
Message-ID: <3ff5dcd7-69a3-4098-92c6-ed1e8f0bd8f9@gmail.com>
Date: Mon, 4 Dec 2023 16:46:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Facebook Minerva Harma (AST2600) BMC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20231204081029.2272626-1-peteryin.openbmc@gmail.com>
 <fddcbad4-5368-4c2a-ba87-f4c4326a8385@linaro.org>
Content-Language: en-US
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <fddcbad4-5368-4c2a-ba87-f4c4326a8385@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Krzysztof Kozlowski 於 12/4/23 16:20 寫道:
> On 04/12/2023 09:10, Peter Yin wrote:
>> Summary:
>> Add linux device tree entry related to Minerva Harma
>> specific devices connected to BMC SoC.
>>
>> v4:https://lore.kernel.org/all/20231204054131.1845775-3-peter.yin@quantatw.com/
>> v3:https://lore.kernel.org/all/20231123050415.3441429-3-peteryin.openbmc@gmail.com/
>> v2:https://lore.kernel.org/all/cdbc75b9-3be1-4017-9bee-c8f161b6843c@linaro.org/
>> v1:https://lore.kernel.org/all/20231024082404.735843-3-peteryin.openbmc@gmail.com/
>>
>> Change log
>> v4 -> v5
>>    - Rename document and file from minerva-harma to harma.
> 
> You must explain that you dropped people's review for some reason.
> 
> Best regards,
> Krzysztof
> 
Due to changes in the project name and content, please assist in 
reviewing it.

Thanks,
Peter.
