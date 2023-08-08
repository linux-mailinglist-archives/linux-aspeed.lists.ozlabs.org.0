Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0057738A6
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 09:40:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UaRsb+eW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKlTZ6hgfz300C
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 17:40:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UaRsb+eW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlTT22KXz2ypt
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Aug 2023 17:40:10 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52227884855so7653123a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Aug 2023 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691480406; x=1692085206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0jYWt89fmFSSrLeUWw+d1IBZy1QszvyM81Tw6WpAio=;
        b=UaRsb+eW+4F8Lh/hpSUwvaCSRLYyt45vAp6RCpht5E0XoTMtB7ipYwRflZrgAvCuC/
         9FHHR9yfwDANDPy6C98e0RvVVEPR1o7XCRdzr/OClf4rO+GnY3tpPfYfVV89nL08jxDg
         rohYH5SJxX0Mvkh2mXq0TntoS4zr0nyKbYvYye2TVqPvxQnQaohvgmOViPEFN317eyBi
         xh+hS662X9LaJvSdXG5ZO60QCHfwh1HZ1tgrcTz9oE7zvDP0W8qnM30WnN3NX6J+8R+f
         mWGABqTD0n109sOSvSheabYwG/WLCfQ/8yonUOK5IxVA5t9VLnkQdBNjzySb7YSeH/Fw
         rOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691480406; x=1692085206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0jYWt89fmFSSrLeUWw+d1IBZy1QszvyM81Tw6WpAio=;
        b=M3rNjECe+vezHVLGR/A2lKzELEkPCCKO0S64kVz6yqfXC5UUMPRHSsceUf4rhov3F/
         FtgmHElAO65p3CiO4acg7cTn9Uad7uDIcJeEUOg+NybkGMb5SnSd4AbsW2fo7n88Jp1U
         X7VDG2YrkQ4p3czfic2NbxR4iD+BUtPojzWedR1yAPY7fiiOA31KyJrzKTLl+b4Dv5Nq
         ywjizcPJFoUYhfHpMDMalisSXXvXwd6CUy+PAs8hYyO/odshll2L3o+2vPxXLQj6hcM+
         EU5+GWb1rcRJECxzzZ9hKLhjURR6v141oTu+yH4HaxJIQlQwVyCj2eitoR5MDk2xNnPv
         85Og==
X-Gm-Message-State: AOJu0YxmFdtceAo3BU+pW4K0G3wsNM623sn3qcRpuVzYonrcsqC9ivOp
	nqXwEV3jHdFF2jQ0CQcloqDdaw==
X-Google-Smtp-Source: AGHT+IF7TwOlxokLzu+o14ONSGlkMy+6q2ZjKbBETRdVIsOWw5nJhhnwkULRQFS4WYp8/hPQ0U/VAw==
X-Received: by 2002:aa7:df0a:0:b0:51d:eb90:4928 with SMTP id c10-20020aa7df0a000000b0051deb904928mr11195752edy.30.1691480406002;
        Tue, 08 Aug 2023 00:40:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7c7c7000000b005222a38c7b2sm6338725eds.48.2023.08.08.00.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:40:05 -0700 (PDT)
Message-ID: <9aae0b76-e5bb-41b5-35f3-1bea43949c61@linaro.org>
Date: Tue, 8 Aug 2023 09:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite 4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230808073000.989942-1-Delphine_CC_Chiu@wiwynn.com>
 <20230808073000.989942-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808073000.989942-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/08/2023 09:29, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite 4.
> 
> Changelog:
> v6 - Change project name from yosemitev4 to yosemite4

Changelog should be under ---

> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---


Best regards,
Krzysztof

